; DESCRIPTION: Renders a orange box of size 116x97 starting at (0, 119).
; PLAN: r0=0(x), r1=119(y), r2=116(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 119
LDI r2, 116
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
