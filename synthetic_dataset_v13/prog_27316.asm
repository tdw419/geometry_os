; DESCRIPTION: Renders a orange box of size 32x38 starting at (181, 69).
; PLAN: r0=181(x), r1=69(y), r2=32(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 69
LDI r2, 32
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
