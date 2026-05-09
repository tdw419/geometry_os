; DESCRIPTION: Sets a single cyan pixel at (260, 85).
; PLAN: r0=260(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 260
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
