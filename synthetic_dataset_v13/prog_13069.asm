; DESCRIPTION: Places a yellow circle of radius 13 at center (186, 183).
; PLAN: r0=186(x), r1=183(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 183
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
