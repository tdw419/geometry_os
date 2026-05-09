; DESCRIPTION: Renders a blue disk with center (242, 148) and radius 31.
; PLAN: r0=242(x), r1=148(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 148
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
