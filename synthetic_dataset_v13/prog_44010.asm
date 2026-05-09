; DESCRIPTION: Renders a orange box of size 35x95 starting at (153, 116).
; PLAN: r0=153(x), r1=116(y), r2=35(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 116
LDI r2, 35
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
