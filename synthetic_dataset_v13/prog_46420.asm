; DESCRIPTION: Places a green dot at position (405, 99).
; PLAN: r0=405(x), r1=99(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 99
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
