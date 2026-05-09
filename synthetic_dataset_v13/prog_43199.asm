; DESCRIPTION: Creates a orange rectangular region at (181, 158) spanning 50 by 92 pixels.
; PLAN: r0=181(x), r1=158(y), r2=50(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 158
LDI r2, 50
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
