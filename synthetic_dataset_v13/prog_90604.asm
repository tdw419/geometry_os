; DESCRIPTION: Sets a single black pixel at (414, 229).
; PLAN: r0=414(x), r1=229(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 229
LDI r2, 0x000000
PSET r0, r1, r2
HALT
