; DESCRIPTION: Renders a orange box of size 112x67 starting at (54, 49).
; PLAN: r0=54(x), r1=49(y), r2=112(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 49
LDI r2, 112
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
