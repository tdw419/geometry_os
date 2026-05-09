; DESCRIPTION: Places a white dot at position (70, 236).
; PLAN: r0=70(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
