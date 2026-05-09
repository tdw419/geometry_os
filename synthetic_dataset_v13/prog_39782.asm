; DESCRIPTION: Places a blue dot at position (320, 177).
; PLAN: r0=320(x), r1=177(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 320
LDI r1, 177
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
