; DESCRIPTION: Creates a orange rectangular region at (99, 161) spanning 106 by 67 pixels.
; PLAN: r0=99(x), r1=161(y), r2=106(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 161
LDI r2, 106
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
