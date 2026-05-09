; DESCRIPTION: Sets a single red pixel at (509, 239).
; PLAN: r0=509(x), r1=239(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 509
LDI r1, 239
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
