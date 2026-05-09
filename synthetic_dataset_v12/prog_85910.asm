; DESCRIPTION: Places a yellow dot at position (25, 36).
; PLAN: r0=25(x), r1=36(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 36
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
