; DESCRIPTION: Sets a single red pixel at (474, 51).
; PLAN: r0=474(x), r1=51(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 474
LDI r1, 51
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
