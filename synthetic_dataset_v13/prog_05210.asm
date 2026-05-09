; DESCRIPTION: Renders a blue box of size 105x59 starting at (288, 118).
; PLAN: r0=288(x), r1=118(y), r2=105(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 118
LDI r2, 105
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
