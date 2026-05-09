; DESCRIPTION: Renders a orange box of size 109x34 starting at (109, 15).
; PLAN: r0=109(x), r1=15(y), r2=109(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 15
LDI r2, 109
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
