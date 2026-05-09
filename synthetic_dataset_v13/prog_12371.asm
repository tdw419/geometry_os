; DESCRIPTION: Places a green dot at position (430, 78).
; PLAN: r0=430(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
