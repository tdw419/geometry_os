; DESCRIPTION: Sets a single cyan pixel at (394, 15).
; PLAN: r0=394(x), r1=15(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 15
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
