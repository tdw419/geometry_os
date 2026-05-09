; DESCRIPTION: Renders a orange box of size 57x78 starting at (339, 10).
; PLAN: r0=339(x), r1=10(y), r2=57(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 10
LDI r2, 57
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
