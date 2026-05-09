; DESCRIPTION: Sets a single cyan pixel at (215, 132).
; PLAN: r0=215(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
