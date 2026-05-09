; DESCRIPTION: Renders a black box of size 92x95 starting at (78, 67).
; PLAN: r0=78(x), r1=67(y), r2=92(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 67
LDI r2, 92
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
