; DESCRIPTION: Creates a orange rectangular region at (312, 205) spanning 97 by 47 pixels.
; PLAN: r0=312(x), r1=205(y), r2=97(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 205
LDI r2, 97
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
