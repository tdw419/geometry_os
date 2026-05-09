; DESCRIPTION: Places a yellow circle of radius 30 at center (185, 135).
; PLAN: r0=185(x), r1=135(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 135
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
