; DESCRIPTION: Renders a orange box of size 117x88 starting at (42, 108).
; PLAN: r0=42(x), r1=108(y), r2=117(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 108
LDI r2, 117
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
