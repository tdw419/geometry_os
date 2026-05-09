; DESCRIPTION: Sets a single cyan pixel at (24, 27).
; PLAN: r0=24(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 27
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
