; DESCRIPTION: Sets a single green pixel at (354, 206).
; PLAN: r0=354(x), r1=206(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 206
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
