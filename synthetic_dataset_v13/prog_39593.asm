; DESCRIPTION: Places a yellow dot at position (53, 33).
; PLAN: r0=53(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 33
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
