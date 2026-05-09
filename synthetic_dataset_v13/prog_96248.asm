; DESCRIPTION: Renders a blue disk with center (214, 208) and radius 43.
; PLAN: r0=214(x), r1=208(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 208
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
