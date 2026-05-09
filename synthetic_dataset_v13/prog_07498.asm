; DESCRIPTION: Renders a red box of size 67x69 starting at (58, 185).
; PLAN: r0=58(x), r1=185(y), r2=67(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 185
LDI r2, 67
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
