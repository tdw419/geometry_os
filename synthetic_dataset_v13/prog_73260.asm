; DESCRIPTION: Sets a single green pixel at (382, 42).
; PLAN: r0=382(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 382
LDI r1, 42
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
