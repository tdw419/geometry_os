; DESCRIPTION: Renders a yellow disk with center (215, 38) and radius 17.
; PLAN: r0=215(x), r1=38(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 38
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
