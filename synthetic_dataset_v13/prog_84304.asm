; DESCRIPTION: Renders a orange box of size 100x68 starting at (62, 109).
; PLAN: r0=62(x), r1=109(y), r2=100(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 109
LDI r2, 100
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
