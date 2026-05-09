; DESCRIPTION: Sets a single cyan pixel at (6, 223).
; PLAN: r0=6(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 223
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
