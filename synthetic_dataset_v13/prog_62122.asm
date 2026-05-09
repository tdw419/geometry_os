; DESCRIPTION: Sets a single yellow pixel at (242, 44).
; PLAN: r0=242(x), r1=44(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 44
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
