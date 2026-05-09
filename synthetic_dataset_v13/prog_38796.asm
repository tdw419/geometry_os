; DESCRIPTION: Creates a orange rectangular region at (88, 28) spanning 110 by 68 pixels.
; PLAN: r0=88(x), r1=28(y), r2=110(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 28
LDI r2, 110
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
