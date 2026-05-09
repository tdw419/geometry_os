; DESCRIPTION: Places a blue dot at position (240, 231).
; PLAN: r0=240(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
