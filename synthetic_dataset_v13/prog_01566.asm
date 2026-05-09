; DESCRIPTION: Places a white dot at position (403, 85).
; PLAN: r0=403(x), r1=85(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 85
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
