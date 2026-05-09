; DESCRIPTION: Sets a single green pixel at (156, 120).
; PLAN: r0=156(x), r1=120(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 120
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
