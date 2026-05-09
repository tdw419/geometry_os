; DESCRIPTION: Places a white dot at position (210, 20).
; PLAN: r0=210(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 20
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
