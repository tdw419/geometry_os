; DESCRIPTION: Renders a orange box of size 59x34 starting at (339, 42).
; PLAN: r0=339(x), r1=42(y), r2=59(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 42
LDI r2, 59
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
