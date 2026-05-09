; DESCRIPTION: Places a green circle of radius 65 at center (141, 74).
; PLAN: r0=141(x), r1=74(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 74
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
