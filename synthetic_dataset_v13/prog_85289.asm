; DESCRIPTION: Renders a green disk with center (61, 118) and radius 38.
; PLAN: r0=61(x), r1=118(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 118
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
