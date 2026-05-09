; DESCRIPTION: Places a blue circle of radius 12 at center (175, 180).
; PLAN: r0=175(x), r1=180(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 180
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
