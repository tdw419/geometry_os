; DESCRIPTION: Creates a orange rectangular region at (227, 185) spanning 67 by 71 pixels.
; PLAN: r0=227(x), r1=185(y), r2=67(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 185
LDI r2, 67
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
