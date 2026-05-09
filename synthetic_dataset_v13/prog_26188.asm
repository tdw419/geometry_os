; DESCRIPTION: Renders a green disk with center (236, 120) and radius 20.
; PLAN: r0=236(x), r1=120(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 120
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
