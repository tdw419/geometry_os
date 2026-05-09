; DESCRIPTION: Places a yellow dot at position (96, 132).
; PLAN: r0=96(x), r1=132(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 132
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
