; DESCRIPTION: Sets a single red pixel at (353, 231).
; PLAN: r0=353(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
