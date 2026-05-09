; DESCRIPTION: Places a blue circle of radius 69 at center (392, 165).
; PLAN: r0=392(x), r1=165(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 165
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
