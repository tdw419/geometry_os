; DESCRIPTION: Places a blue dot at position (128, 54).
; PLAN: r0=128(x), r1=54(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 54
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
