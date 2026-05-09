; DESCRIPTION: Sets a single red pixel at (356, 58).
; PLAN: r0=356(x), r1=58(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 58
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
