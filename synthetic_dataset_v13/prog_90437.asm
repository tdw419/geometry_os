; DESCRIPTION: Places a red circle of radius 35 at center (151, 54).
; PLAN: r0=151(x), r1=54(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 54
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
