; DESCRIPTION: Sets a single cyan pixel at (61, 23).
; PLAN: r0=61(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
