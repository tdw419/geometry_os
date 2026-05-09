; DESCRIPTION: Renders a orange box of size 80x67 starting at (58, 114).
; PLAN: r0=58(x), r1=114(y), r2=80(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 114
LDI r2, 80
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
