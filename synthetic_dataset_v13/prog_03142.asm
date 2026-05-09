; DESCRIPTION: Creates a purple rectangular region at (122, 3) spanning 52 by 38 pixels.
; PLAN: r0=122(x), r1=3(y), r2=52(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 3
LDI r2, 52
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
