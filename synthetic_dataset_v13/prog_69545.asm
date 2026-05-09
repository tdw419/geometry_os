; DESCRIPTION: Renders a orange box of size 109x78 starting at (54, 52).
; PLAN: r0=54(x), r1=52(y), r2=109(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 52
LDI r2, 109
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
