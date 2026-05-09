; DESCRIPTION: Renders a orange box of size 76x31 starting at (385, 101).
; PLAN: r0=385(x), r1=101(y), r2=76(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 101
LDI r2, 76
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
