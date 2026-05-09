; DESCRIPTION: Places a red dot at position (379, 242).
; PLAN: r0=379(x), r1=242(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 242
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
