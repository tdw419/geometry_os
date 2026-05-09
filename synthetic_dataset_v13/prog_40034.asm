; DESCRIPTION: Places a white dot at position (67, 6).
; PLAN: r0=67(x), r1=6(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 6
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
