; DESCRIPTION: Composite: Places a red line segment connecting (39, 227) to (265, 21) then Renders a purple disk with center (53, 226) and radius 20 then Draws a yellow rectangle at (345, 13) with width 112 and height 107.
; PLAN: r0=39(x1), r1=227(y1), r2=265(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=226(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=13(y), r12=112(width), r13=107(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 227
LDI r2, 265
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 226
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 13
LDI r12, 112
LDI r13, 107
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
