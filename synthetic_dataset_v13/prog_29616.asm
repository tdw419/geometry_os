; DESCRIPTION: Places a white dot at position (102, 144).
; PLAN: r0=102(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
