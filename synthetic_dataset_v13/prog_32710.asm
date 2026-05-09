; DESCRIPTION: Sets a single red pixel at (253, 208).
; PLAN: r0=253(x), r1=208(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 208
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
