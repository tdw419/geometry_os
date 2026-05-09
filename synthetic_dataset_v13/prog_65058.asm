; DESCRIPTION: Places a yellow circle of radius 70 at center (196, 115).
; PLAN: r0=196(x), r1=115(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 115
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
