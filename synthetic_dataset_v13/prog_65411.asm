; DESCRIPTION: Renders a green disk with center (291, 154) and radius 55.
; PLAN: r0=291(x), r1=154(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 154
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
