; DESCRIPTION: Composite: Places a orange line segment connecting (26, 6) to (85, 240) then Places a green dot at position (319, 81).
; PLAN: r0=26(x1), r1=6(y1), r2=85(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=81(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 6
LDI r2, 85
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 81
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
