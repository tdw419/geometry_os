; DESCRIPTION: Places a red dot at position (190, 46).
; PLAN: r0=190(x), r1=46(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 46
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
