; DESCRIPTION: Creates a blue rectangular region at (43, 123) spanning 80 by 96 pixels.
; PLAN: r0=43(x), r1=123(y), r2=80(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 123
LDI r2, 80
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
