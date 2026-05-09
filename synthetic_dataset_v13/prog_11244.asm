; DESCRIPTION: Creates a yellow rectangular region at (105, 22) spanning 119 by 117 pixels.
; PLAN: r0=105(x), r1=22(y), r2=119(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 22
LDI r2, 119
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
