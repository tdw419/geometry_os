; DESCRIPTION: Places a green dot at position (130, 157).
; PLAN: r0=130(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 157
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
