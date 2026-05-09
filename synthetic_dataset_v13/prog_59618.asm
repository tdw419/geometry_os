; DESCRIPTION: Places a yellow dot at position (24, 12).
; PLAN: r0=24(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
