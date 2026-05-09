; DESCRIPTION: Sets a single black pixel at (120, 16).
; PLAN: r0=120(x), r1=16(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 16
LDI r2, 0x000000
PSET r0, r1, r2
HALT
