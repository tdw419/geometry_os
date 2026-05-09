; DESCRIPTION: Places a yellow circle of radius 79 at center (95, 152).
; PLAN: r0=95(x), r1=152(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 152
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
