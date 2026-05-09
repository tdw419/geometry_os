; DESCRIPTION: Renders a yellow disk with center (344, 118) and radius 72.
; PLAN: r0=344(x), r1=118(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 118
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
