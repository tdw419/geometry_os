; DESCRIPTION: Places a white dot at position (344, 33).
; PLAN: r0=344(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
