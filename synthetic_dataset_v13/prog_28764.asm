; DESCRIPTION: Sets a single cyan pixel at (292, 178).
; PLAN: r0=292(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 292
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
