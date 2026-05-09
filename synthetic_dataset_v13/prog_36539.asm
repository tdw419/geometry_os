; DESCRIPTION: Places a yellow dot at position (10, 203).
; PLAN: r0=10(x), r1=203(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 203
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
