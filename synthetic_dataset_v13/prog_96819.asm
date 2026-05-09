; DESCRIPTION: Sets a single red pixel at (402, 44).
; PLAN: r0=402(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 402
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
