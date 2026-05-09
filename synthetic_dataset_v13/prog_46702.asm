; DESCRIPTION: Renders a orange box of size 59x119 starting at (363, 100).
; PLAN: r0=363(x), r1=100(y), r2=59(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 100
LDI r2, 59
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
