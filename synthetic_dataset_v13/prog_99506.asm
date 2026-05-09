; DESCRIPTION: Places a blue dot at position (256, 95).
; PLAN: r0=256(x), r1=95(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 95
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
