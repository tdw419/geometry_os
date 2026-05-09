; DESCRIPTION: Creates a blue rectangular region at (398, 123) spanning 88 by 95 pixels.
; PLAN: r0=398(x), r1=123(y), r2=88(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 123
LDI r2, 88
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
