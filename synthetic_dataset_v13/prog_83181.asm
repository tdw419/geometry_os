; DESCRIPTION: Creates a orange rectangular region at (140, 20) spanning 29 by 88 pixels.
; PLAN: r0=140(x), r1=20(y), r2=29(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 20
LDI r2, 29
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
