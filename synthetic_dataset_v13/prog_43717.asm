; DESCRIPTION: Creates a orange rectangular region at (29, 88) spanning 112 by 83 pixels.
; PLAN: r0=29(x), r1=88(y), r2=112(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 88
LDI r2, 112
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
