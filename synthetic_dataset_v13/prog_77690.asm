; DESCRIPTION: Composite: Places a orange line segment connecting (228, 62) to (83, 128) then Places a purple dot at position (88, 51).
; PLAN: r0=228(x1), r1=62(y1), r2=83(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=51(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 62
LDI r2, 83
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 51
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
