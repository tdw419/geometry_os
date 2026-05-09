; DESCRIPTION: Places a yellow circle of radius 20 at center (241, 230).
; PLAN: r0=241(x), r1=230(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 230
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
