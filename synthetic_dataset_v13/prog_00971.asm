; DESCRIPTION: Renders a yellow disk with center (317, 222) and radius 19.
; PLAN: r0=317(x), r1=222(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 222
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
