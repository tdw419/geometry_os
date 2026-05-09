; DESCRIPTION: Places a white dot at position (355, 219).
; PLAN: r0=355(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 355
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
