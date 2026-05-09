; DESCRIPTION: Places a blue dot at position (398, 220).
; PLAN: r0=398(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
