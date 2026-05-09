; DESCRIPTION: Places a blue circle of radius 40 at center (433, 117).
; PLAN: r0=433(x), r1=117(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 117
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
