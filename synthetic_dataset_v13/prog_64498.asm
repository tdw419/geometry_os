; DESCRIPTION: Renders a blue disk with center (213, 59) and radius 45.
; PLAN: r0=213(x), r1=59(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 59
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
