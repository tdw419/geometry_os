; DESCRIPTION: Places a blue circle of radius 19 at center (450, 86).
; PLAN: r0=450(x), r1=86(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 86
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
