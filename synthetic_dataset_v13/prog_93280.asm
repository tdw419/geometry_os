; DESCRIPTION: Places a blue dot at position (480, 160).
; PLAN: r0=480(x), r1=160(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 480
LDI r1, 160
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
