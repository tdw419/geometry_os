; DESCRIPTION: Places a red dot at position (429, 53).
; PLAN: r0=429(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 53
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
