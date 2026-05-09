; DESCRIPTION: Places a white dot at position (172, 188).
; PLAN: r0=172(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
