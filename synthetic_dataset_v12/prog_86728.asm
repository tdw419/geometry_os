; DESCRIPTION: Sets a single cyan pixel at (244, 79).
; PLAN: r0=244(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
