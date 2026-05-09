; DESCRIPTION: Sets a single green pixel at (474, 38).
; PLAN: r0=474(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 474
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
