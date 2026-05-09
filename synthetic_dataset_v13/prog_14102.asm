; DESCRIPTION: Renders a blue box of size 101x113 starting at (175, 74).
; PLAN: r0=175(x), r1=74(y), r2=101(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 74
LDI r2, 101
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
