; DESCRIPTION: Places a blue circle of radius 47 at center (328, 87).
; PLAN: r0=328(x), r1=87(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 87
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
