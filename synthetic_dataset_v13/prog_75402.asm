; DESCRIPTION: Places a white dot at position (420, 206).
; PLAN: r0=420(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
