; DESCRIPTION: Places a blue circle of radius 42 at center (339, 186).
; PLAN: r0=339(x), r1=186(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 186
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
