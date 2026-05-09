; DESCRIPTION: Renders a blue box of size 16x40 starting at (0, 216).
; PLAN: r0=0(x), r1=216(y), r2=16(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 216
LDI r2, 16
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
