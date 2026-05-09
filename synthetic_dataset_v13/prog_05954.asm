; DESCRIPTION: Creates a orange rectangular region at (334, 149) spanning 88 by 99 pixels.
; PLAN: r0=334(x), r1=149(y), r2=88(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 149
LDI r2, 88
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
