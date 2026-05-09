; DESCRIPTION: Sets a single black pixel at (237, 216).
; PLAN: r0=237(x), r1=216(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 216
LDI r2, 0x000000
PSET r0, r1, r2
HALT
