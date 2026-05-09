; DESCRIPTION: Creates a purple rectangular region at (176, 54) spanning 85 by 88 pixels.
; PLAN: r0=176(x), r1=54(y), r2=85(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 54
LDI r2, 85
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
