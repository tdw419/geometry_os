; DESCRIPTION: Places a purple circle of radius 16 at center (455, 46).
; PLAN: r0=455(x), r1=46(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 46
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
