; DESCRIPTION: Renders a blue disk with center (346, 161) and radius 76.
; PLAN: r0=346(x), r1=161(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 161
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
