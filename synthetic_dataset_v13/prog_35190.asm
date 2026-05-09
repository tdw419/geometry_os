; DESCRIPTION: Sets a single cyan pixel at (459, 32).
; PLAN: r0=459(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 32
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
