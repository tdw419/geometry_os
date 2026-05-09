; DESCRIPTION: Composite: Places a blue 49x43 rectangle at position (35, 30) then Renders a orange line between points (228, 51) and (256, 77) then Creates a black circular shape at (293, 118) with radius 67.
; PLAN: r0=35(x), r1=30(y), r2=49(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x1), r6=51(y1), r7=256(x2), r8=77(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=118(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 35
LDI r1, 30
LDI r2, 49
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 51
LDI r7, 256
LDI r8, 77
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 118
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
