; DESCRIPTION: Renders a green box of size 67x114 starting at (179, 69).
; PLAN: r0=179(x), r1=69(y), r2=67(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 69
LDI r2, 67
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
