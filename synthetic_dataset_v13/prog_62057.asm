; DESCRIPTION: Places a yellow dot at position (23, 75).
; PLAN: r0=23(x), r1=75(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 75
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
