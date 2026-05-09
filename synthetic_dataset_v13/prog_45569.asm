; DESCRIPTION: Sets a single red pixel at (128, 60).
; PLAN: r0=128(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
