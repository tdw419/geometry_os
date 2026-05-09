; DESCRIPTION: Places a yellow dot at position (165, 25).
; PLAN: r0=165(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 25
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
