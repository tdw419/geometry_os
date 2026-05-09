; DESCRIPTION: Creates a orange rectangular region at (34, 172) spanning 101 by 64 pixels.
; PLAN: r0=34(x), r1=172(y), r2=101(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 172
LDI r2, 101
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
