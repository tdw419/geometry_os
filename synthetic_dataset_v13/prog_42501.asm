; DESCRIPTION: Composite: Places a orange line segment connecting (20, 132) to (359, 36) then Places a black dot at position (448, 218).
; PLAN: r0=20(x1), r1=132(y1), r2=359(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=218(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 20
LDI r1, 132
LDI r2, 359
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 218
LDI r7, 0x000000
PSET r5, r6, r7
HALT
