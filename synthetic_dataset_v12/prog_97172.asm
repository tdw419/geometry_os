; DESCRIPTION: Places a blue circle of radius 79 at center (123, 82).
; PLAN: r0=123(x), r1=82(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 82
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
