; DESCRIPTION: Places a yellow circle of radius 33 at center (223, 186).
; PLAN: r0=223(x), r1=186(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 186
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
