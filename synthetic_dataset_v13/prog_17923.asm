; DESCRIPTION: Creates a yellow rectangular region at (397, 52) spanning 20 by 118 pixels.
; PLAN: r0=397(x), r1=52(y), r2=20(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 52
LDI r2, 20
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
