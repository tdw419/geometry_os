; DESCRIPTION: Sets a single cyan pixel at (223, 207).
; PLAN: r0=223(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
