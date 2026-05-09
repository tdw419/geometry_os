; DESCRIPTION: Places a yellow dot at position (182, 115).
; PLAN: r0=182(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
