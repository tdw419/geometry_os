; DESCRIPTION: Sets a single cyan pixel at (501, 86).
; PLAN: r0=501(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
