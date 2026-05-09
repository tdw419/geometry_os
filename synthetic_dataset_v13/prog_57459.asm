; DESCRIPTION: Places a yellow dot at position (31, 176).
; PLAN: r0=31(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
