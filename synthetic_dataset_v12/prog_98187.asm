; DESCRIPTION: Places a blue dot at position (18, 253).
; PLAN: r0=18(x), r1=253(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 253
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
