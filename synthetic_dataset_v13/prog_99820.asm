; DESCRIPTION: Sets a single cyan pixel at (99, 10).
; PLAN: r0=99(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
