; DESCRIPTION: Creates a orange rectangular region at (431, 64) spanning 11 by 116 pixels.
; PLAN: r0=431(x), r1=64(y), r2=11(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 64
LDI r2, 11
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
