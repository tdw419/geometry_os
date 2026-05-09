; DESCRIPTION: Renders a orange box of size 33x84 starting at (34, 90).
; PLAN: r0=34(x), r1=90(y), r2=33(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 90
LDI r2, 33
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
