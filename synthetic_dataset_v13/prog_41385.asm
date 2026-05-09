; DESCRIPTION: Creates a orange rectangular region at (114, 50) spanning 88 by 70 pixels.
; PLAN: r0=114(x), r1=50(y), r2=88(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 50
LDI r2, 88
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
