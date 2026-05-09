; DESCRIPTION: Places a blue circle of radius 73 at center (120, 91).
; PLAN: r0=120(x), r1=91(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 91
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
