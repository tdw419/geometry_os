; DESCRIPTION: Places a red circle of radius 74 at center (105, 159).
; PLAN: r0=105(x), r1=159(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 159
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
