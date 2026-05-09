; DESCRIPTION: Places a white dot at position (185, 188).
; PLAN: r0=185(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
