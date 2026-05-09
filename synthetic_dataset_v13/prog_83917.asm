; DESCRIPTION: Places a white dot at position (371, 242).
; PLAN: r0=371(x), r1=242(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 371
LDI r1, 242
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
