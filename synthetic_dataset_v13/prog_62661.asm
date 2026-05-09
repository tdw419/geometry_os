; DESCRIPTION: Places a yellow circle of radius 57 at center (145, 68).
; PLAN: r0=145(x), r1=68(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 68
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
