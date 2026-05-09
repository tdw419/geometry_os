; DESCRIPTION: Places a blue dot at position (260, 17).
; PLAN: r0=260(x), r1=17(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 260
LDI r1, 17
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
