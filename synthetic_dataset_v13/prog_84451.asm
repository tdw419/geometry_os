; DESCRIPTION: Places a blue circle of radius 14 at center (42, 221).
; PLAN: r0=42(x), r1=221(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 221
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
