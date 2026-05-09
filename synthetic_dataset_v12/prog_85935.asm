; DESCRIPTION: Sets a single red pixel at (403, 64).
; PLAN: r0=403(x), r1=64(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 64
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
