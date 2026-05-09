; DESCRIPTION: Renders a orange box of size 24x119 starting at (313, 108).
; PLAN: r0=313(x), r1=108(y), r2=24(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 108
LDI r2, 24
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
