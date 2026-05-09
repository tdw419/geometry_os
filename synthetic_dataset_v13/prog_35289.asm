; DESCRIPTION: Sets a single green pixel at (281, 96).
; PLAN: r0=281(x), r1=96(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 281
LDI r1, 96
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
