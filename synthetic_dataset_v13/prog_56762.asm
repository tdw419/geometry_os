; DESCRIPTION: Sets a single green pixel at (244, 107).
; PLAN: r0=244(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
