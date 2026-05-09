; DESCRIPTION: Places a yellow dot at position (348, 18).
; PLAN: r0=348(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 348
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
