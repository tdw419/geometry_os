; DESCRIPTION: Places a yellow dot at position (421, 6).
; PLAN: r0=421(x), r1=6(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 421
LDI r1, 6
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
