; DESCRIPTION: Places a red circle of radius 17 at center (25, 80).
; PLAN: r0=25(x), r1=80(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 80
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
