; DESCRIPTION: Places a yellow dot at position (454, 10).
; PLAN: r0=454(x), r1=10(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 454
LDI r1, 10
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
