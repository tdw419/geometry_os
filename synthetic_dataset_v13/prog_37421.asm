; DESCRIPTION: Creates a orange rectangular region at (3, 60) spanning 34 by 60 pixels.
; PLAN: r0=3(x), r1=60(y), r2=34(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 60
LDI r2, 34
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
