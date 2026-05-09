; DESCRIPTION: Composite: Places a orange dot at position (472, 219) then Renders a black line between points (495, 39) and (287, 4) then Places a purple circle of radius 45 at center (196, 196).
; PLAN: r0=472(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=39(y1), r7=287(x2), r8=4(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=196(y), r12=45(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 472
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 495
LDI r6, 39
LDI r7, 287
LDI r8, 4
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 196
LDI r12, 45
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
