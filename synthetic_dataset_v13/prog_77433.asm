; DESCRIPTION: Sets a single cyan pixel at (93, 165).
; PLAN: r0=93(x), r1=165(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 165
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
