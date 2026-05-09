; DESCRIPTION: Places a red dot at position (154, 115).
; PLAN: r0=154(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
