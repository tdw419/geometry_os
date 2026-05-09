; DESCRIPTION: Places a yellow dot at position (187, 63).
; PLAN: r0=187(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 63
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
