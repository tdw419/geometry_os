; DESCRIPTION: Places a blue circle of radius 33 at center (244, 113).
; PLAN: r0=244(x), r1=113(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 113
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
