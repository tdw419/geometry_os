; DESCRIPTION: Creates a orange rectangular region at (19, 160) spanning 116 by 76 pixels.
; PLAN: r0=19(x), r1=160(y), r2=116(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 160
LDI r2, 116
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
