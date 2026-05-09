; DESCRIPTION: Renders a orange box of size 33x84 starting at (67, 3).
; PLAN: r0=67(x), r1=3(y), r2=33(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 3
LDI r2, 33
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
