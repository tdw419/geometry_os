; DESCRIPTION: Places a yellow circle of radius 69 at center (169, 115).
; PLAN: r0=169(x), r1=115(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 115
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
