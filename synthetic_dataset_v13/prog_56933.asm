; DESCRIPTION: Renders a blue disk with center (480, 164) and radius 15.
; PLAN: r0=480(x), r1=164(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 164
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
