; DESCRIPTION: Places a green dot at position (37, 162).
; PLAN: r0=37(x), r1=162(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 162
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
