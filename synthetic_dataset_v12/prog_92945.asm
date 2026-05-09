; DESCRIPTION: Places a green dot at position (511, 226).
; PLAN: r0=511(x), r1=226(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 511
LDI r1, 226
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
