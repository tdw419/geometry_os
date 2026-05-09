; DESCRIPTION: Renders a white disk with center (308, 59) and radius 22.
; PLAN: r0=308(x), r1=59(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 59
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
