; DESCRIPTION: Places a blue circle of radius 50 at center (462, 170).
; PLAN: r0=462(x), r1=170(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 170
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
