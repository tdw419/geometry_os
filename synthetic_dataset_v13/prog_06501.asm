; DESCRIPTION: Sets a single yellow pixel at (444, 150).
; PLAN: r0=444(x), r1=150(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 150
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
