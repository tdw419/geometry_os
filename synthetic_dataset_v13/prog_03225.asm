; DESCRIPTION: Creates a blue rectangular region at (339, 128) spanning 29 by 21 pixels.
; PLAN: r0=339(x), r1=128(y), r2=29(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 128
LDI r2, 29
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
