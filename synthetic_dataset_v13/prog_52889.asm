; DESCRIPTION: Places a yellow circle of radius 42 at center (145, 129).
; PLAN: r0=145(x), r1=129(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 129
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
