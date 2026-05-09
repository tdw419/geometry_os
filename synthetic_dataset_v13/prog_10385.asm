; DESCRIPTION: Creates a orange rectangular region at (43, 189) spanning 47 by 67 pixels.
; PLAN: r0=43(x), r1=189(y), r2=47(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 189
LDI r2, 47
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
