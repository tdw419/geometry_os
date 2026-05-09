; DESCRIPTION: Places a white dot at position (440, 28).
; PLAN: r0=440(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 440
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
