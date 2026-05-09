; DESCRIPTION: Places a green dot at position (255, 20).
; PLAN: r0=255(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
