; DESCRIPTION: Renders a blue box of size 29x34 starting at (220, 153).
; PLAN: r0=220(x), r1=153(y), r2=29(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 153
LDI r2, 29
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
