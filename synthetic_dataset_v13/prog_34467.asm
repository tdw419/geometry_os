; DESCRIPTION: Places a green circle of radius 64 at center (158, 102).
; PLAN: r0=158(x), r1=102(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 102
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
