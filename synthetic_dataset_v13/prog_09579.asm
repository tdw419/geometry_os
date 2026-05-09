; DESCRIPTION: Places a blue circle of radius 58 at center (120, 117).
; PLAN: r0=120(x), r1=117(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 117
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
