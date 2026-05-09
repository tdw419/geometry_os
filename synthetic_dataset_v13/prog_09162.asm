; DESCRIPTION: Renders a orange box of size 45x84 starting at (194, 66).
; PLAN: r0=194(x), r1=66(y), r2=45(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 66
LDI r2, 45
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
