; DESCRIPTION: Places a white dot at position (74, 36).
; PLAN: r0=74(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 36
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
