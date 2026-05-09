; DESCRIPTION: Renders a red box of size 101x67 starting at (83, 69).
; PLAN: r0=83(x), r1=69(y), r2=101(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 69
LDI r2, 101
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
