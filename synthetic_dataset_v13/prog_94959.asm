; DESCRIPTION: Places a green dot at position (379, 53).
; PLAN: r0=379(x), r1=53(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 53
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
