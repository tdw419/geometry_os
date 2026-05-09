; DESCRIPTION: Sets a single red pixel at (394, 20).
; PLAN: r0=394(x), r1=20(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 20
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
