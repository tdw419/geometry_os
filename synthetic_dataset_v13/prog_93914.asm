; DESCRIPTION: Composite: Places a blue circle of radius 51 at center (437, 94) then Places a black line segment connecting (274, 37) to (107, 105) then Places a green 110x32 rectangle at position (219, 69).
; PLAN: r0=437(x), r1=94(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=37(y1), r7=107(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=69(y), r12=110(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 94
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 37
LDI r7, 107
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 69
LDI r12, 110
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
