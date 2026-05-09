; DESCRIPTION: Creates a white rectangular region at (128, 9) spanning 94 by 88 pixels.
; PLAN: r0=128(x), r1=9(y), r2=94(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 9
LDI r2, 94
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
