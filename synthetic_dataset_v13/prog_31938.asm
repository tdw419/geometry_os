; DESCRIPTION: Places a yellow dot at position (116, 107).
; PLAN: r0=116(x), r1=107(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 107
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
