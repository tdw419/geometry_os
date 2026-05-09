; DESCRIPTION: Sets a single cyan pixel at (494, 21).
; PLAN: r0=494(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 494
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
