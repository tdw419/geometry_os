; DESCRIPTION: Places a white dot at position (304, 101).
; PLAN: r0=304(x), r1=101(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 101
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
