; DESCRIPTION: Sets a single black pixel at (394, 128).
; PLAN: r0=394(x), r1=128(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 128
LDI r2, 0x000000
PSET r0, r1, r2
HALT
