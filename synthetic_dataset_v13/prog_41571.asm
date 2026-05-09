; DESCRIPTION: Places a green dot at position (97, 176).
; PLAN: r0=97(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 176
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
