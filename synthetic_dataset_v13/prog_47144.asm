; DESCRIPTION: Sets a single cyan pixel at (256, 63).
; PLAN: r0=256(x), r1=63(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 63
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
