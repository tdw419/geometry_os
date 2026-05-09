; DESCRIPTION: Creates a yellow rectangular region at (390, 131) spanning 74 by 22 pixels.
; PLAN: r0=390(x), r1=131(y), r2=74(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 131
LDI r2, 74
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
