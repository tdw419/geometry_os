; DESCRIPTION: Creates a blue rectangular region at (14, 59) spanning 62 by 15 pixels.
; PLAN: r0=14(x), r1=59(y), r2=62(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 59
LDI r2, 62
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
