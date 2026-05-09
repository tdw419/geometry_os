; DESCRIPTION: Places a red circle of radius 80 at center (390, 146).
; PLAN: r0=390(x), r1=146(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 146
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
