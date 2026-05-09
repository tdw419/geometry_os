; DESCRIPTION: Renders a orange box of size 76x60 starting at (123, 72).
; PLAN: r0=123(x), r1=72(y), r2=76(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 72
LDI r2, 76
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
