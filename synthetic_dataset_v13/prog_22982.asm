; DESCRIPTION: Places a red circle of radius 56 at center (261, 97).
; PLAN: r0=261(x), r1=97(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 97
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
