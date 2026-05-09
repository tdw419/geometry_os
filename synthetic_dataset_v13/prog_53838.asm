; DESCRIPTION: Sets a single black pixel at (456, 91).
; PLAN: r0=456(x), r1=91(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 91
LDI r2, 0x000000
PSET r0, r1, r2
HALT
