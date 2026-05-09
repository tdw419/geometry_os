; DESCRIPTION: Places a red circle of radius 80 at center (149, 97).
; PLAN: r0=149(x), r1=97(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 97
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
