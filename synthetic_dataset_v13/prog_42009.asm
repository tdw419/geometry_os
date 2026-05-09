; DESCRIPTION: Sets a single red pixel at (490, 172).
; PLAN: r0=490(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 172
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
