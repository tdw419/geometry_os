; DESCRIPTION: Places a yellow dot at position (25, 143).
; PLAN: r0=25(x), r1=143(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 143
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
