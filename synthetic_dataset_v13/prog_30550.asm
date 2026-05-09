; DESCRIPTION: Creates a purple rectangular region at (30, 175) spanning 20 by 68 pixels.
; PLAN: r0=30(x), r1=175(y), r2=20(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 175
LDI r2, 20
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
