; DESCRIPTION: Places a yellow circle of radius 49 at center (195, 178).
; PLAN: r0=195(x), r1=178(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 178
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
