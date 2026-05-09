; DESCRIPTION: Renders a orange box of size 66x13 starting at (134, 212).
; PLAN: r0=134(x), r1=212(y), r2=66(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 212
LDI r2, 66
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
