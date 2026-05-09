; DESCRIPTION: Renders a orange box of size 40x88 starting at (163, 89).
; PLAN: r0=163(x), r1=89(y), r2=40(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 89
LDI r2, 40
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
