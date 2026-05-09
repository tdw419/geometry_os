; DESCRIPTION: Places a blue circle of radius 42 at center (292, 129).
; PLAN: r0=292(x), r1=129(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 129
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
