; DESCRIPTION: Creates a orange rectangular region at (8, 116) spanning 97 by 116 pixels.
; PLAN: r0=8(x), r1=116(y), r2=97(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 116
LDI r2, 97
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
