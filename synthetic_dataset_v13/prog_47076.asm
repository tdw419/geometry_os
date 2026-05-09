; DESCRIPTION: Places a yellow circle of radius 69 at center (360, 96).
; PLAN: r0=360(x), r1=96(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 96
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
