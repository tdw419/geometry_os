; DESCRIPTION: Places a white dot at position (36, 171).
; PLAN: r0=36(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
