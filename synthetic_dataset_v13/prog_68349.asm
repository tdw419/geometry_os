; DESCRIPTION: Places a yellow dot at position (365, 101).
; PLAN: r0=365(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
