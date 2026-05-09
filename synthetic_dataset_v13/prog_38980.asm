; DESCRIPTION: Sets a single blue pixel at (401, 188).
; PLAN: r0=401(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
