; DESCRIPTION: Places a blue dot at position (330, 21).
; PLAN: r0=330(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 330
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
