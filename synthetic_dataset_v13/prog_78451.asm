; DESCRIPTION: Places a white dot at position (300, 250).
; PLAN: r0=300(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 300
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
