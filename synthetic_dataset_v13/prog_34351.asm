; DESCRIPTION: Creates a blue rectangular region at (364, 7) spanning 64 by 88 pixels.
; PLAN: r0=364(x), r1=7(y), r2=64(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 7
LDI r2, 64
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
