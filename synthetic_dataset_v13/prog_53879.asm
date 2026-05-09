; DESCRIPTION: Sets a single red pixel at (45, 62).
; PLAN: r0=45(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
