; DESCRIPTION: Places a purple dot at position (348, 222).
; PLAN: r0=348(x), r1=222(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 348
LDI r1, 222
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
