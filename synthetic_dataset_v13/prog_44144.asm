; DESCRIPTION: Creates a yellow rectangular region at (54, 131) spanning 33 by 118 pixels.
; PLAN: r0=54(x), r1=131(y), r2=33(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 131
LDI r2, 33
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
