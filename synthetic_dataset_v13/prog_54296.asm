; DESCRIPTION: Renders a blue disk with center (256, 118) and radius 27.
; PLAN: r0=256(x), r1=118(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 118
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
