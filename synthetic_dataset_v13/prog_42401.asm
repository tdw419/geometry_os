; DESCRIPTION: Places a yellow dot at position (430, 36).
; PLAN: r0=430(x), r1=36(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 36
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
