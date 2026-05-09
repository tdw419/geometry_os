; DESCRIPTION: Places a green circle of radius 62 at center (188, 108).
; PLAN: r0=188(x), r1=108(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 108
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
