; DESCRIPTION: Renders a orange box of size 15x38 starting at (492, 69).
; PLAN: r0=492(x), r1=69(y), r2=15(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 69
LDI r2, 15
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
