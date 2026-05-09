; DESCRIPTION: Renders a orange box of size 75x106 starting at (93, 98).
; PLAN: r0=93(x), r1=98(y), r2=75(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 98
LDI r2, 75
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
