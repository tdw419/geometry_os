; DESCRIPTION: Places a green circle of radius 22 at center (221, 45).
; PLAN: r0=221(x), r1=45(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 45
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
