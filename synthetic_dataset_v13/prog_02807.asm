; DESCRIPTION: Creates a purple rectangular region at (16, 61) spanning 88 by 87 pixels.
; PLAN: r0=16(x), r1=61(y), r2=88(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 61
LDI r2, 88
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
