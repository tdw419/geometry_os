; DESCRIPTION: Renders a blue disk with center (182, 97) and radius 52.
; PLAN: r0=182(x), r1=97(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 97
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
