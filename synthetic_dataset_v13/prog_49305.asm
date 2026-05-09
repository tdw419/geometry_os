; DESCRIPTION: Creates a orange rectangular region at (28, 69) spanning 113 by 49 pixels.
; PLAN: r0=28(x), r1=69(y), r2=113(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 69
LDI r2, 113
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
