; DESCRIPTION: Places a blue circle of radius 67 at center (186, 186).
; PLAN: r0=186(x), r1=186(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 186
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
