; DESCRIPTION: Sets a single black pixel at (228, 128).
; PLAN: r0=228(x), r1=128(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 128
LDI r2, 0x000000
PSET r0, r1, r2
HALT
