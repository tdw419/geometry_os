; DESCRIPTION: Renders a blue disk with center (180, 171) and radius 69.
; PLAN: r0=180(x), r1=171(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 171
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
