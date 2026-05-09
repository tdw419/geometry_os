; DESCRIPTION: Composite: Draws a green rectangle at (33, 75) with width 67 and height 29 then Renders a cyan disk with center (450, 218) and radius 10 then Draws a green line from (462, 181) to (249, 45).
; PLAN: r0=33(x), r1=75(y), r2=67(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=218(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x1), r11=181(y1), r12=249(x2), r13=45(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 75
LDI r2, 67
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 218
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 181
LDI r12, 249
LDI r13, 45
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
