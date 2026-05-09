; DESCRIPTION: Places a blue circle of radius 63 at center (198, 152).
; PLAN: r0=198(x), r1=152(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 152
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
