; DESCRIPTION: Renders a orange box of size 38x34 starting at (153, 76).
; PLAN: r0=153(x), r1=76(y), r2=38(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 76
LDI r2, 38
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
