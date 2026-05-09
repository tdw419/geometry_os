; DESCRIPTION: Places a green dot at position (465, 139).
; PLAN: r0=465(x), r1=139(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 139
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
