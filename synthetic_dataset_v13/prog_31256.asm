; DESCRIPTION: Places a yellow circle of radius 52 at center (269, 185).
; PLAN: r0=269(x), r1=185(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 185
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
