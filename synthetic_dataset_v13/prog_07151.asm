; DESCRIPTION: Renders a blue box of size 92x107 starting at (67, 45).
; PLAN: r0=67(x), r1=45(y), r2=92(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 45
LDI r2, 92
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
