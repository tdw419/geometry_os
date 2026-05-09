; DESCRIPTION: Sets a single red pixel at (19, 222).
; PLAN: r0=19(x), r1=222(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 222
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
