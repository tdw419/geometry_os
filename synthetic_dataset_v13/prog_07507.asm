; DESCRIPTION: Renders a blue disk with center (176, 127) and radius 78.
; PLAN: r0=176(x), r1=127(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 127
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
