; DESCRIPTION: Places a white dot at position (149, 176).
; PLAN: r0=149(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
