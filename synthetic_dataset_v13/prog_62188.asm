; DESCRIPTION: Places a yellow circle of radius 69 at center (251, 106).
; PLAN: r0=251(x), r1=106(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 106
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
