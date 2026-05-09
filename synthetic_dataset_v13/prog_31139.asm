; DESCRIPTION: Sets a single cyan pixel at (131, 227).
; PLAN: r0=131(x), r1=227(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 227
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
