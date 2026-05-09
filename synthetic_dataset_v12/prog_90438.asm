; DESCRIPTION: Sets a single purple pixel at (252, 239).
; PLAN: r0=252(x), r1=239(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 239
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
