; DESCRIPTION: Places a yellow dot at position (451, 99).
; PLAN: r0=451(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 451
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
