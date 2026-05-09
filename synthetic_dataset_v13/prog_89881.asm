; DESCRIPTION: Places a green dot at position (467, 137).
; PLAN: r0=467(x), r1=137(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 467
LDI r1, 137
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
