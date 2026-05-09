; DESCRIPTION: Renders a purple box of size 55x88 starting at (103, 67).
; PLAN: r0=103(x), r1=67(y), r2=55(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 67
LDI r2, 55
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
