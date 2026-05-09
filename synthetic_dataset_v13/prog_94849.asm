; DESCRIPTION: Places a white dot at position (16, 233).
; PLAN: r0=16(x), r1=233(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 233
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
