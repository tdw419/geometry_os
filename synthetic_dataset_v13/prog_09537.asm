; DESCRIPTION: Renders a blue box of size 67x46 starting at (153, 92).
; PLAN: r0=153(x), r1=92(y), r2=67(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 92
LDI r2, 67
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
