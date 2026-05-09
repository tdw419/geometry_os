; DESCRIPTION: Places a green dot at position (104, 255).
; PLAN: r0=104(x), r1=255(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 255
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
