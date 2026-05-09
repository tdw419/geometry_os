; DESCRIPTION: Creates a green rectangular region at (123, 131) spanning 106 by 118 pixels.
; PLAN: r0=123(x), r1=131(y), r2=106(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 131
LDI r2, 106
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
