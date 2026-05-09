; DESCRIPTION: Places a blue dot at position (223, 150).
; PLAN: r0=223(x), r1=150(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 150
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
