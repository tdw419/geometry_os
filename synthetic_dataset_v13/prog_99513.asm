; DESCRIPTION: Places a blue dot at position (470, 59).
; PLAN: r0=470(x), r1=59(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 470
LDI r1, 59
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
