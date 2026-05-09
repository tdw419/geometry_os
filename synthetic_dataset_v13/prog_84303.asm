; DESCRIPTION: Sets a single cyan pixel at (466, 71).
; PLAN: r0=466(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 71
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
