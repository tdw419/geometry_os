; DESCRIPTION: Creates a orange rectangular region at (84, 62) spanning 28 by 106 pixels.
; PLAN: r0=84(x), r1=62(y), r2=28(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 62
LDI r2, 28
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
