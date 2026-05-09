; DESCRIPTION: Places a white dot at position (495, 163).
; PLAN: r0=495(x), r1=163(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 163
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
