; DESCRIPTION: Sets a single cyan pixel at (52, 50).
; PLAN: r0=52(x), r1=50(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 50
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
