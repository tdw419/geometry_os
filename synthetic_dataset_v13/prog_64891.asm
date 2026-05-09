; DESCRIPTION: Creates a orange rectangular region at (88, 14) spanning 47 by 26 pixels.
; PLAN: r0=88(x), r1=14(y), r2=47(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 14
LDI r2, 47
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
