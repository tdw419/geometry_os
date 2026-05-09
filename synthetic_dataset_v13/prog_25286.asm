; DESCRIPTION: Places a yellow dot at position (319, 22).
; PLAN: r0=319(x), r1=22(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 319
LDI r1, 22
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
