; DESCRIPTION: Sets a single red pixel at (68, 12).
; PLAN: r0=68(x), r1=12(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 12
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
