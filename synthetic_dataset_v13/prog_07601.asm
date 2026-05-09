; DESCRIPTION: Sets a single blue pixel at (268, 142).
; PLAN: r0=268(x), r1=142(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 142
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
