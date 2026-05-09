; DESCRIPTION: Renders a green disk with center (277, 29) and radius 22.
; PLAN: r0=277(x), r1=29(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 29
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
