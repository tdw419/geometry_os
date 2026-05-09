; DESCRIPTION: Sets a single red pixel at (433, 23).
; PLAN: r0=433(x), r1=23(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 433
LDI r1, 23
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
