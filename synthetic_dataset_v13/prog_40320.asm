; DESCRIPTION: Renders a orange box of size 24x106 starting at (26, 61).
; PLAN: r0=26(x), r1=61(y), r2=24(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 61
LDI r2, 24
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
