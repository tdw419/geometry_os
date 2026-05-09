; DESCRIPTION: Renders a blue disk with center (268, 93) and radius 58.
; PLAN: r0=268(x), r1=93(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 93
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
