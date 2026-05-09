; DESCRIPTION: Sets a single blue pixel at (396, 27).
; PLAN: r0=396(x), r1=27(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 396
LDI r1, 27
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
