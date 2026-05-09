; DESCRIPTION: Places a blue dot at position (215, 55).
; PLAN: r0=215(x), r1=55(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 55
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
