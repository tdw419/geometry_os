; DESCRIPTION: Places a purple circle of radius 26 at center (398, 171).
; PLAN: r0=398(x), r1=171(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 171
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
