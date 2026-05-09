; DESCRIPTION: Sets a single green pixel at (326, 50).
; PLAN: r0=326(x), r1=50(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 326
LDI r1, 50
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
