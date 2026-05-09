; DESCRIPTION: Sets a single green pixel at (505, 159).
; PLAN: r0=505(x), r1=159(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 505
LDI r1, 159
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
