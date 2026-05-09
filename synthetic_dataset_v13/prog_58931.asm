; DESCRIPTION: Places a blue dot at position (66, 244).
; PLAN: r0=66(x), r1=244(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 244
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
