; DESCRIPTION: Creates a orange rectangular region at (54, 141) spanning 67 by 53 pixels.
; PLAN: r0=54(x), r1=141(y), r2=67(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 141
LDI r2, 67
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
