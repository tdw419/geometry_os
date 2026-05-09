; DESCRIPTION: Creates a green rectangular region at (142, 101) spanning 114 by 117 pixels.
; PLAN: r0=142(x), r1=101(y), r2=114(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 101
LDI r2, 114
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
