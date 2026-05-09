; DESCRIPTION: Places a red circle of radius 79 at center (144, 148).
; PLAN: r0=144(x), r1=148(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 148
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
