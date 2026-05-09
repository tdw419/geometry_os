; DESCRIPTION: Composite: Renders a green disk with center (106, 72) and radius 68 then Draws a cyan line from (258, 205) to (303, 181) then Draws a green rectangle at (69, 148) with width 116 and height 45.
; PLAN: r0=106(x), r1=72(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x1), r6=205(y1), r7=303(x2), r8=181(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=148(y), r12=116(width), r13=45(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 72
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 205
LDI r7, 303
LDI r8, 181
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 148
LDI r12, 116
LDI r13, 45
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
