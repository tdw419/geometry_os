; DESCRIPTION: Sets a single white pixel at (250, 231).
; PLAN: r0=250(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
