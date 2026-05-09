; DESCRIPTION: Renders a black box of size 67x45 starting at (135, 67).
; PLAN: r0=135(x), r1=67(y), r2=67(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 67
LDI r2, 67
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
