; DESCRIPTION: Sets a single red pixel at (510, 253).
; PLAN: r0=510(x), r1=253(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 510
LDI r1, 253
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
