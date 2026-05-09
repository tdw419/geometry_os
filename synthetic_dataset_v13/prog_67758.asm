; DESCRIPTION: Sets a single orange pixel at (379, 221).
; PLAN: r0=379(x), r1=221(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 221
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
