; DESCRIPTION: Renders a orange box of size 72x26 starting at (7, 78).
; PLAN: r0=7(x), r1=78(y), r2=72(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 78
LDI r2, 72
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
