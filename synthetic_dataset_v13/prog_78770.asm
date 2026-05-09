; DESCRIPTION: Renders a orange box of size 73x49 starting at (149, 84).
; PLAN: r0=149(x), r1=84(y), r2=73(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 84
LDI r2, 73
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
