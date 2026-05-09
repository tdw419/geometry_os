; DESCRIPTION: Places a white dot at position (400, 9).
; PLAN: r0=400(x), r1=9(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 9
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
