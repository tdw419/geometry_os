; DESCRIPTION: Creates a orange rectangular region at (219, 68) spanning 73 by 116 pixels.
; PLAN: r0=219(x), r1=68(y), r2=73(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 68
LDI r2, 73
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
