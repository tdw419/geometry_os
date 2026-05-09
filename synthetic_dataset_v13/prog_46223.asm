; DESCRIPTION: Renders a green disk with center (112, 55) and radius 16.
; PLAN: r0=112(x), r1=55(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 55
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
