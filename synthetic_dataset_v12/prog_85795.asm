; DESCRIPTION: Sets a single blue pixel at (168, 184).
; PLAN: r0=168(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
