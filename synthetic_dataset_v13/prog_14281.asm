; DESCRIPTION: Places a green dot at position (507, 66).
; PLAN: r0=507(x), r1=66(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 66
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
