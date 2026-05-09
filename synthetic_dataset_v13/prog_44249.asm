; DESCRIPTION: Sets a single green pixel at (237, 138).
; PLAN: r0=237(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
