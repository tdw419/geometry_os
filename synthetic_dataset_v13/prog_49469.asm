; DESCRIPTION: Sets a single cyan pixel at (402, 247).
; PLAN: r0=402(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 402
LDI r1, 247
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
