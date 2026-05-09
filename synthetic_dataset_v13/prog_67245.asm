; DESCRIPTION: Sets a single cyan pixel at (290, 206).
; PLAN: r0=290(x), r1=206(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 206
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
