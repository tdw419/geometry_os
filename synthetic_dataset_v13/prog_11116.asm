; DESCRIPTION: Sets a single red pixel at (210, 183).
; PLAN: r0=210(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
