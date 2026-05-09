; DESCRIPTION: Places a purple dot at position (511, 5).
; PLAN: r0=511(x), r1=5(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 511
LDI r1, 5
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
