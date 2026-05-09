; DESCRIPTION: Places a green circle of radius 74 at center (131, 178).
; PLAN: r0=131(x), r1=178(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 178
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
