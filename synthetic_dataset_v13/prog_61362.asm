; DESCRIPTION: Places a red dot at position (384, 11).
; PLAN: r0=384(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
