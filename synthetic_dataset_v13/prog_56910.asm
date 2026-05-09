; DESCRIPTION: Composite: Places a orange line segment connecting (428, 108) to (257, 40) then Places a black 24x18 rectangle at position (466, 230) then Renders a black disk with center (39, 51) and radius 15.
; PLAN: r0=428(x1), r1=108(y1), r2=257(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=230(y), r7=24(width), r8=18(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x), r11=51(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 428
LDI r1, 108
LDI r2, 257
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 230
LDI r7, 24
LDI r8, 18
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 51
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
