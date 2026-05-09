; DESCRIPTION: Composite: Draws a yellow rectangle at (310, 161) with width 28 and height 14 then Places a red dot at position (462, 180) then Places a purple line segment connecting (357, 250) to (34, 153).
; PLAN: r0=310(x), r1=161(y), r2=28(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=180(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=357(x1), r11=250(y1), r12=34(x2), r13=153(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 161
LDI r2, 28
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 180
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 357
LDI r11, 250
LDI r12, 34
LDI r13, 153
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
