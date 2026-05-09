; DESCRIPTION: Renders a orange box of size 16x101 starting at (31, 119).
; PLAN: r0=31(x), r1=119(y), r2=16(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 119
LDI r2, 16
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
