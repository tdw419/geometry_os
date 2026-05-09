; DESCRIPTION: Sets a single blue pixel at (487, 126).
; PLAN: r0=487(x), r1=126(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 126
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
