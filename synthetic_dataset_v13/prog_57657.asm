; DESCRIPTION: Sets a single cyan pixel at (286, 73).
; PLAN: r0=286(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
