; DESCRIPTION: Places a red circle of radius 14 at center (74, 222).
; PLAN: r0=74(x), r1=222(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 222
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
