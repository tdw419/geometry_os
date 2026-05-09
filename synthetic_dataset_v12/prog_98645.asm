; DESCRIPTION: Sets a single red pixel at (43, 8).
; PLAN: r0=43(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 8
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
