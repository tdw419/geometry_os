; DESCRIPTION: Places a blue dot at position (65, 187).
; PLAN: r0=65(x), r1=187(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 187
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
