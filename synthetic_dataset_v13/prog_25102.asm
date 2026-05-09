; DESCRIPTION: Renders a orange box of size 23x102 starting at (423, 148).
; PLAN: r0=423(x), r1=148(y), r2=23(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 148
LDI r2, 23
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
