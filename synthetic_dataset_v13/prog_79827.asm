; DESCRIPTION: Places a white dot at position (416, 3).
; PLAN: r0=416(x), r1=3(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 3
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
