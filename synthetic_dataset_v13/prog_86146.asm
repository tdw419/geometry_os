; DESCRIPTION: Sets a single black pixel at (444, 83).
; PLAN: r0=444(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
HALT
