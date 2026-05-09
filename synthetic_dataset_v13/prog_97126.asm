; DESCRIPTION: Places a blue circle of radius 27 at center (169, 62).
; PLAN: r0=169(x), r1=62(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 62
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
