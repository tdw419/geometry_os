; DESCRIPTION: Sets a single green pixel at (229, 42).
; PLAN: r0=229(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 42
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
