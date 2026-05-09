; DESCRIPTION: Sets a single cyan pixel at (1, 58).
; PLAN: r0=1(x), r1=58(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 58
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
