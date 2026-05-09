; DESCRIPTION: Renders a blue disk with center (199, 57) and radius 14.
; PLAN: r0=199(x), r1=57(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 57
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
