; DESCRIPTION: Places a yellow circle of radius 33 at center (326, 89).
; PLAN: r0=326(x), r1=89(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 89
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
