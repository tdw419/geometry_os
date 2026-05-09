; DESCRIPTION: Renders a blue disk with center (354, 186) and radius 35.
; PLAN: r0=354(x), r1=186(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 186
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
