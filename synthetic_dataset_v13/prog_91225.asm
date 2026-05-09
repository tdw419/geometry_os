; DESCRIPTION: Sets a single black pixel at (242, 149).
; PLAN: r0=242(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 149
LDI r2, 0x000000
PSET r0, r1, r2
HALT
