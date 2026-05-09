; DESCRIPTION: Renders a blue box of size 114x30 starting at (134, 92).
; PLAN: r0=134(x), r1=92(y), r2=114(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 92
LDI r2, 114
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
