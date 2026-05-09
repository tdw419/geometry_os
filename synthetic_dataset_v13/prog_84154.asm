; DESCRIPTION: Places a white dot at position (72, 220).
; PLAN: r0=72(x), r1=220(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 220
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
