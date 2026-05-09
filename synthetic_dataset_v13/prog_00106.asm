; DESCRIPTION: Places a yellow dot at position (461, 135).
; PLAN: r0=461(x), r1=135(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 135
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
