; DESCRIPTION: Places a blue dot at position (305, 176).
; PLAN: r0=305(x), r1=176(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 176
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
