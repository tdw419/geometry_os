; DESCRIPTION: Sets a single white pixel at (275, 231).
; PLAN: r0=275(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 275
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
