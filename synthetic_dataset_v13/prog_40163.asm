; DESCRIPTION: Places a white dot at position (132, 153).
; PLAN: r0=132(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 153
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
