; DESCRIPTION: Renders a green disk with center (258, 154) and radius 56.
; PLAN: r0=258(x), r1=154(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 154
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
