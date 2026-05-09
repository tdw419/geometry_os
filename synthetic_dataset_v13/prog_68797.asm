; DESCRIPTION: Sets a single green pixel at (207, 209).
; PLAN: r0=207(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
