; DESCRIPTION: Sets a single red pixel at (354, 231).
; PLAN: r0=354(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
