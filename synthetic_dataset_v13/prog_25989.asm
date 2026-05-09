; DESCRIPTION: Sets a single green pixel at (398, 142).
; PLAN: r0=398(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
