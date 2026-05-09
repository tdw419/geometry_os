; DESCRIPTION: Sets a single yellow pixel at (127, 8).
; PLAN: r0=127(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
