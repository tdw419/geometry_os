; DESCRIPTION: Creates a white rectangular region at (19, 8) spanning 88 by 94 pixels.
; PLAN: r0=19(x), r1=8(y), r2=88(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 8
LDI r2, 88
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
