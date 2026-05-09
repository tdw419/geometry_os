; DESCRIPTION: Places a white dot at position (14, 174).
; PLAN: r0=14(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
