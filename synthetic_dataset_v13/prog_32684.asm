; DESCRIPTION: Sets a single cyan pixel at (223, 195).
; PLAN: r0=223(x), r1=195(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 195
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
