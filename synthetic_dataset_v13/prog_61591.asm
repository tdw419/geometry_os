; DESCRIPTION: Places a green circle of radius 34 at center (369, 185).
; PLAN: r0=369(x), r1=185(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 185
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
