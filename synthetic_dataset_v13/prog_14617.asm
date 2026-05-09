; DESCRIPTION: Sets a single blue pixel at (206, 242).
; PLAN: r0=206(x), r1=242(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 242
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
