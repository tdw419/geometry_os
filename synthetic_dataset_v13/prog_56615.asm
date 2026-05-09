; DESCRIPTION: Places a yellow dot at position (384, 9).
; PLAN: r0=384(x), r1=9(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 9
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
