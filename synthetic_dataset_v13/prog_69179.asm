; DESCRIPTION: Creates a orange rectangular region at (163, 158) spanning 66 by 54 pixels.
; PLAN: r0=163(x), r1=158(y), r2=66(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 158
LDI r2, 66
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
