; DESCRIPTION: Creates a red rectangular region at (252, 69) spanning 15 by 67 pixels.
; PLAN: r0=252(x), r1=69(y), r2=15(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 69
LDI r2, 15
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
