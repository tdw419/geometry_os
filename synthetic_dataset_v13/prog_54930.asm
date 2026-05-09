; DESCRIPTION: Places a green dot at position (376, 233).
; PLAN: r0=376(x), r1=233(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 376
LDI r1, 233
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
