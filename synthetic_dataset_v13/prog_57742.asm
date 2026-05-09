; DESCRIPTION: Sets a single black pixel at (150, 57).
; PLAN: r0=150(x), r1=57(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 57
LDI r2, 0x000000
PSET r0, r1, r2
HALT
