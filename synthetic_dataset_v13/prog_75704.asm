; DESCRIPTION: Renders a orange box of size 61x88 starting at (2, 163).
; PLAN: r0=2(x), r1=163(y), r2=61(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 163
LDI r2, 61
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
