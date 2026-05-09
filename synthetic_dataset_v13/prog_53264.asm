; DESCRIPTION: Places a cyan dot at position (379, 80).
; PLAN: r0=379(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
