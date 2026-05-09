; DESCRIPTION: Places a blue dot at position (99, 27).
; PLAN: r0=99(x), r1=27(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 27
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
