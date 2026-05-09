; DESCRIPTION: Sets a single black pixel at (187, 42).
; PLAN: r0=187(x), r1=42(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 42
LDI r2, 0x000000
PSET r0, r1, r2
HALT
