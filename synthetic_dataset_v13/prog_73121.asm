; DESCRIPTION: Renders a blue disk with center (27, 196) and radius 21.
; PLAN: r0=27(x), r1=196(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 196
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
