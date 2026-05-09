; DESCRIPTION: Renders a orange box of size 88x29 starting at (69, 73).
; PLAN: r0=69(x), r1=73(y), r2=88(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 73
LDI r2, 88
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
