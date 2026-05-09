; DESCRIPTION: Renders a blue disk with center (275, 70) and radius 40.
; PLAN: r0=275(x), r1=70(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 70
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
