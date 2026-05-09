; DESCRIPTION: Places a white dot at position (307, 255).
; PLAN: r0=307(x), r1=255(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 307
LDI r1, 255
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
