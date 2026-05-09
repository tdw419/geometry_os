; DESCRIPTION: Creates a blue rectangular region at (153, 194) spanning 88 by 14 pixels.
; PLAN: r0=153(x), r1=194(y), r2=88(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 194
LDI r2, 88
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
