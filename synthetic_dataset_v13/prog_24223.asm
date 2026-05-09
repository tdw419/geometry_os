; DESCRIPTION: Places a blue circle of radius 34 at center (178, 221).
; PLAN: r0=178(x), r1=221(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 221
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
