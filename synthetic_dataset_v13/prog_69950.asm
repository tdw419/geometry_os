; DESCRIPTION: Places a blue dot at position (409, 197).
; PLAN: r0=409(x), r1=197(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 409
LDI r1, 197
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
