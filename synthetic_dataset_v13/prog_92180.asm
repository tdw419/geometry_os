; DESCRIPTION: Renders a blue disk with center (374, 97) and radius 25.
; PLAN: r0=374(x), r1=97(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 97
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
