; DESCRIPTION: Sets a single blue pixel at (209, 214).
; PLAN: r0=209(x), r1=214(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 214
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
