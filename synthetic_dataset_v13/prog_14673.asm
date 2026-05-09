; DESCRIPTION: Renders a green disk with center (101, 50) and radius 31.
; PLAN: r0=101(x), r1=50(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 50
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
