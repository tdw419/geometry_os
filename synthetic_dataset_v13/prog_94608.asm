; DESCRIPTION: Composite: Places a orange dot at position (399, 182) then Places a purple line segment connecting (219, 126) to (420, 85).
; PLAN: r0=399(x), r1=182(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=126(y1), r7=420(x2), r8=85(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 182
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 219
LDI r6, 126
LDI r7, 420
LDI r8, 85
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
