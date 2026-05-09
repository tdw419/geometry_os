; DESCRIPTION: Renders a orange box of size 91x114 starting at (164, 67).
; PLAN: r0=164(x), r1=67(y), r2=91(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 67
LDI r2, 91
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
