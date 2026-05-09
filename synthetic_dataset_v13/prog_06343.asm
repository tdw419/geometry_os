; DESCRIPTION: Creates a blue rectangular region at (59, 123) spanning 56 by 88 pixels.
; PLAN: r0=59(x), r1=123(y), r2=56(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 123
LDI r2, 56
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
