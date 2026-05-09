; DESCRIPTION: Places a blue dot at position (239, 195).
; PLAN: r0=239(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 195
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
