; DESCRIPTION: Places a white dot at position (428, 53).
; PLAN: r0=428(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 428
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
