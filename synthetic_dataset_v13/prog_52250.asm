; DESCRIPTION: Places a green dot at position (381, 9).
; PLAN: r0=381(x), r1=9(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 381
LDI r1, 9
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
