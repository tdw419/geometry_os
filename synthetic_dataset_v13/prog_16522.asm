; DESCRIPTION: Places a green circle of radius 38 at center (466, 153).
; PLAN: r0=466(x), r1=153(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 153
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
