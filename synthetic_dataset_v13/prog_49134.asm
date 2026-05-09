; DESCRIPTION: Creates a blue rectangular region at (4, 68) spanning 62 by 58 pixels.
; PLAN: r0=4(x), r1=68(y), r2=62(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 68
LDI r2, 62
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
