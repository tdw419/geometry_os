; DESCRIPTION: Places a blue circle of radius 44 at center (420, 92).
; PLAN: r0=420(x), r1=92(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 92
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
