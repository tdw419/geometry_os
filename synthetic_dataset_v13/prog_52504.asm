; DESCRIPTION: Places a green dot at position (484, 39).
; PLAN: r0=484(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
