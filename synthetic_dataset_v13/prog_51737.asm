; DESCRIPTION: Composite: Renders a purple line between points (462, 254) and (293, 59) then Places a red 88x51 rectangle at position (59, 200) then Sets a single orange pixel at (497, 0).
; PLAN: r0=462(x1), r1=254(y1), r2=293(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=200(y), r7=88(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x), r11=0(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 462
LDI r1, 254
LDI r2, 293
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 200
LDI r7, 88
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 0
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
