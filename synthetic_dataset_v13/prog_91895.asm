; DESCRIPTION: Composite: Draws a black rectangle at (440, 101) with width 46 and height 100 then Draws a magenta line from (374, 49) to (171, 100) then Renders a white disk with center (321, 69) and radius 32.
; PLAN: r0=440(x), r1=101(y), r2=46(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x1), r6=49(y1), r7=171(x2), r8=100(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=69(y), r12=32(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 101
LDI r2, 46
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 49
LDI r7, 171
LDI r8, 100
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 69
LDI r12, 32
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
