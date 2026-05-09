; DESCRIPTION: Creates a orange rectangular region at (364, 34) spanning 114 by 107 pixels.
; PLAN: r0=364(x), r1=34(y), r2=114(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 34
LDI r2, 114
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
