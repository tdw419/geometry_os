; DESCRIPTION: Places a blue dot at position (413, 255).
; PLAN: r0=413(x), r1=255(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 413
LDI r1, 255
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
