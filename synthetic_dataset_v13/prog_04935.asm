; DESCRIPTION: Places a red dot at position (223, 139).
; PLAN: r0=223(x), r1=139(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 139
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
