; DESCRIPTION: Renders a orange box of size 100x106 starting at (98, 33).
; PLAN: r0=98(x), r1=33(y), r2=100(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 33
LDI r2, 100
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
