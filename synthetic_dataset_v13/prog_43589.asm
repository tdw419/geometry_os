; DESCRIPTION: Renders a yellow disk with center (356, 112) and radius 32.
; PLAN: r0=356(x), r1=112(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 112
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
