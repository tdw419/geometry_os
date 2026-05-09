; DESCRIPTION: Places a green dot at position (325, 194).
; PLAN: r0=325(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 325
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
