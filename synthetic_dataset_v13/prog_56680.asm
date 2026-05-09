; DESCRIPTION: Sets a single cyan pixel at (166, 200).
; PLAN: r0=166(x), r1=200(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 200
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
