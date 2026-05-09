; DESCRIPTION: Creates a orange rectangular region at (361, 69) spanning 43 by 116 pixels.
; PLAN: r0=361(x), r1=69(y), r2=43(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 69
LDI r2, 43
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
