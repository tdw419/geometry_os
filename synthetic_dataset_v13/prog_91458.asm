; DESCRIPTION: Renders a blue disk with center (95, 124) and radius 56.
; PLAN: r0=95(x), r1=124(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 124
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
