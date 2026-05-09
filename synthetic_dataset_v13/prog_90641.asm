; DESCRIPTION: Places a white dot at position (238, 150).
; PLAN: r0=238(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 150
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
