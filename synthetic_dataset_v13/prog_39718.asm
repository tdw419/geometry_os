; DESCRIPTION: Places a yellow dot at position (463, 46).
; PLAN: r0=463(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
