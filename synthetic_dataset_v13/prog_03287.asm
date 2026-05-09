; DESCRIPTION: Renders a red box of size 58x53 starting at (14, 67).
; PLAN: r0=14(x), r1=67(y), r2=58(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 67
LDI r2, 58
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
