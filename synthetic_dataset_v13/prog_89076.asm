; DESCRIPTION: Places a white dot at position (305, 140).
; PLAN: r0=305(x), r1=140(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 140
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
