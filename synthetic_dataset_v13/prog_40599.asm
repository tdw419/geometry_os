; DESCRIPTION: Places a purple dot at position (117, 231).
; PLAN: r0=117(x), r1=231(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 231
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
