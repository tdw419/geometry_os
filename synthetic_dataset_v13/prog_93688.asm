; DESCRIPTION: Places a white dot at position (457, 225).
; PLAN: r0=457(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 457
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
