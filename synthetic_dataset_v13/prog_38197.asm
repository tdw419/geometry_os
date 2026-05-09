; DESCRIPTION: Creates a orange rectangular region at (163, 123) spanning 37 by 92 pixels.
; PLAN: r0=163(x), r1=123(y), r2=37(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 123
LDI r2, 37
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
