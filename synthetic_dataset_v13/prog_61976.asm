; DESCRIPTION: Places a white dot at position (249, 212).
; PLAN: r0=249(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
