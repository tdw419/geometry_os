; DESCRIPTION: Sets a single green pixel at (386, 153).
; PLAN: r0=386(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 386
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
