; DESCRIPTION: Sets a single green pixel at (434, 189).
; PLAN: r0=434(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
