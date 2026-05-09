; DESCRIPTION: Places a green dot at position (462, 25).
; PLAN: r0=462(x), r1=25(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 462
LDI r1, 25
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
