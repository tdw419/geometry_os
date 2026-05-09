; DESCRIPTION: Places a green dot at position (99, 99).
; PLAN: r0=99(x), r1=99(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 99
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
