; DESCRIPTION: Creates a purple rectangular region at (324, 179) spanning 52 by 62 pixels.
; PLAN: r0=324(x), r1=179(y), r2=52(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 179
LDI r2, 52
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
