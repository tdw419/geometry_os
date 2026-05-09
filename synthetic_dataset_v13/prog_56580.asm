; DESCRIPTION: Renders a orange box of size 26x95 starting at (258, 112).
; PLAN: r0=258(x), r1=112(y), r2=26(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 112
LDI r2, 26
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
