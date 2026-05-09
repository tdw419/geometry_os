; DESCRIPTION: Places a white dot at position (424, 92).
; PLAN: r0=424(x), r1=92(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 92
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
