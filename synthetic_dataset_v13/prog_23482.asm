; DESCRIPTION: Creates a purple rectangular region at (112, 78) spanning 88 by 77 pixels.
; PLAN: r0=112(x), r1=78(y), r2=88(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 78
LDI r2, 88
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
