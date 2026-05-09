; DESCRIPTION: Places a yellow circle of radius 80 at center (254, 83).
; PLAN: r0=254(x), r1=83(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 83
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
