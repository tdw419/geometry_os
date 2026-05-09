; DESCRIPTION: Sets a single cyan pixel at (250, 10).
; PLAN: r0=250(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
