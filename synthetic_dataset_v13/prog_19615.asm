; DESCRIPTION: Places a blue circle of radius 29 at center (136, 186).
; PLAN: r0=136(x), r1=186(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 186
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
