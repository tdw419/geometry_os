; DESCRIPTION: Places a green circle of radius 36 at center (165, 157).
; PLAN: r0=165(x), r1=157(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 157
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
