; DESCRIPTION: Places a green dot at position (425, 123).
; PLAN: r0=425(x), r1=123(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 425
LDI r1, 123
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
