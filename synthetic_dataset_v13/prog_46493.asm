; DESCRIPTION: Places a green dot at position (416, 128).
; PLAN: r0=416(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
