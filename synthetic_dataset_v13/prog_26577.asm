; DESCRIPTION: Creates a blue rectangular region at (403, 149) spanning 101 by 88 pixels.
; PLAN: r0=403(x), r1=149(y), r2=101(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 149
LDI r2, 101
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
