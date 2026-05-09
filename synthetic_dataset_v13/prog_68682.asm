; DESCRIPTION: Renders a yellow disk with center (349, 153) and radius 24.
; PLAN: r0=349(x), r1=153(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 153
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
