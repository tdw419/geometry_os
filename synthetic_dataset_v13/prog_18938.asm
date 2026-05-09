; DESCRIPTION: Renders a blue disk with center (291, 67) and radius 39.
; PLAN: r0=291(x), r1=67(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 67
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
