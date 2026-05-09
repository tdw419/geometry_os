; DESCRIPTION: Places a blue circle of radius 79 at center (290, 168).
; PLAN: r0=290(x), r1=168(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 168
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
