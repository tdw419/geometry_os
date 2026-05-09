; DESCRIPTION: Places a yellow dot at position (424, 87).
; PLAN: r0=424(x), r1=87(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 87
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
