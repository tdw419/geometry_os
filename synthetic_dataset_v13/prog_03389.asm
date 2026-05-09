; DESCRIPTION: Places a purple circle of radius 51 at center (234, 178).
; PLAN: r0=234(x), r1=178(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 178
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
