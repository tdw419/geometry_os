; DESCRIPTION: Sets a single green pixel at (184, 207).
; PLAN: r0=184(x), r1=207(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 207
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
