; DESCRIPTION: Places a yellow dot at position (134, 190).
; PLAN: r0=134(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
