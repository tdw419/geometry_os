; DESCRIPTION: Places a white dot at position (167, 157).
; PLAN: r0=167(x), r1=157(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 157
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
