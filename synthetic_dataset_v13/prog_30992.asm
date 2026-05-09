; DESCRIPTION: Places a yellow dot at position (495, 13).
; PLAN: r0=495(x), r1=13(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 13
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
