; DESCRIPTION: Creates a yellow rectangular region at (94, 64) spanning 68 by 88 pixels.
; PLAN: r0=94(x), r1=64(y), r2=68(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 64
LDI r2, 68
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
