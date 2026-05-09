; DESCRIPTION: Places a blue circle of radius 32 at center (209, 50).
; PLAN: r0=209(x), r1=50(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 50
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
