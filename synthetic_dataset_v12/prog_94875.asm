; DESCRIPTION: Composite: Renders a white box of size 40x51 starting at (227, 72) then Creates a yellow circular shape at (35, 97) with radius 34 then Draws a blue line from (175, 145) to (149, 39).
; PLAN: r0=227(x), r1=72(y), r2=40(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=97(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=145(y1), r12=149(x2), r13=39(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 72
LDI r2, 40
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 97
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 145
LDI r12, 149
LDI r13, 39
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
