; DESCRIPTION: Places a green dot at position (269, 144).
; PLAN: r0=269(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
