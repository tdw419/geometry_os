; DESCRIPTION: Renders a orange box of size 10x44 starting at (227, 98).
; PLAN: r0=227(x), r1=98(y), r2=10(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 98
LDI r2, 10
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
