; DESCRIPTION: Renders a orange box of size 88x55 starting at (166, 73).
; PLAN: r0=166(x), r1=73(y), r2=88(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 73
LDI r2, 88
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
