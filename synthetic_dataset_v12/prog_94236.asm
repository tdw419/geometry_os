; DESCRIPTION: Sets a single red pixel at (291, 108).
; PLAN: r0=291(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
