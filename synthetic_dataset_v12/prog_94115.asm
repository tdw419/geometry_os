; DESCRIPTION: Places a white dot at position (411, 121).
; PLAN: r0=411(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 411
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
