; DESCRIPTION: Sets a single white pixel at (417, 142).
; PLAN: r0=417(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
