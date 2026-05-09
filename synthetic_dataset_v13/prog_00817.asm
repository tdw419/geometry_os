; DESCRIPTION: Places a red dot at position (456, 65).
; PLAN: r0=456(x), r1=65(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 65
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
