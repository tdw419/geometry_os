; DESCRIPTION: Renders a orange box of size 85x78 starting at (301, 11).
; PLAN: r0=301(x), r1=11(y), r2=85(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 11
LDI r2, 85
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
