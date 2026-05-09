; DESCRIPTION: Sets a single red pixel at (206, 116).
; PLAN: r0=206(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
