; DESCRIPTION: Creates a purple rectangular region at (253, 38) spanning 83 by 88 pixels.
; PLAN: r0=253(x), r1=38(y), r2=83(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 38
LDI r2, 83
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
