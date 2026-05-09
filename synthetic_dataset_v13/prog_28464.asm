; DESCRIPTION: Places a red circle of radius 52 at center (416, 62).
; PLAN: r0=416(x), r1=62(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 62
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
