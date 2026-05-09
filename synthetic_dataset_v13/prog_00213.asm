; DESCRIPTION: Renders a green disk with center (69, 58) and radius 58.
; PLAN: r0=69(x), r1=58(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 58
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
