; DESCRIPTION: Places a white dot at position (183, 103).
; PLAN: r0=183(x), r1=103(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 103
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
