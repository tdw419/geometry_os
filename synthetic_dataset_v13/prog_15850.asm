; DESCRIPTION: Renders a orange box of size 49x36 starting at (457, 184).
; PLAN: r0=457(x), r1=184(y), r2=49(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 184
LDI r2, 49
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
