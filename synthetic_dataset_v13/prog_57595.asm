; DESCRIPTION: Renders a yellow disk with center (169, 160) and radius 38.
; PLAN: r0=169(x), r1=160(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 160
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
