; DESCRIPTION: Composite: Creates a blue circular shape at (300, 186) with radius 24 then Draws a green line from (121, 56) to (63, 67) then Draws a white rectangle at (122, 55) with width 18 and height 11.
; PLAN: r0=300(x), r1=186(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x1), r6=56(y1), r7=63(x2), r8=67(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=55(y), r12=18(width), r13=11(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 186
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 56
LDI r7, 63
LDI r8, 67
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 55
LDI r12, 18
LDI r13, 11
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
