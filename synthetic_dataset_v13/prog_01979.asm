; DESCRIPTION: Places a green dot at position (330, 106).
; PLAN: r0=330(x), r1=106(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 330
LDI r1, 106
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
