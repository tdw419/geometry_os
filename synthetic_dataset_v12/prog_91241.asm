; DESCRIPTION: Renders a yellow disk with center (96, 96) and radius 36.
; PLAN: r0=96(x), r1=96(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 96
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
