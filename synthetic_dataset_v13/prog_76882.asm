; DESCRIPTION: Places a blue circle of radius 54 at center (172, 113).
; PLAN: r0=172(x), r1=113(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 113
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
