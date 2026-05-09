; DESCRIPTION: Renders a blue disk with center (482, 203) and radius 16.
; PLAN: r0=482(x), r1=203(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 203
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
