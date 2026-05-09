; DESCRIPTION: Renders a orange box of size 62x67 starting at (187, 69).
; PLAN: r0=187(x), r1=69(y), r2=62(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 69
LDI r2, 62
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
