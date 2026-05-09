; DESCRIPTION: Creates a orange rectangular region at (60, 31) spanning 112 by 62 pixels.
; PLAN: r0=60(x), r1=31(y), r2=112(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 31
LDI r2, 112
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
