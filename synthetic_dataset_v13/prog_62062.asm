; DESCRIPTION: Places a yellow dot at position (356, 226).
; PLAN: r0=356(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 226
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
