; DESCRIPTION: Places a green circle of radius 62 at center (236, 183).
; PLAN: r0=236(x), r1=183(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 183
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
