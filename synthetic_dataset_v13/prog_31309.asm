; DESCRIPTION: Renders a blue box of size 25x108 starting at (375, 106).
; PLAN: r0=375(x), r1=106(y), r2=25(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 106
LDI r2, 25
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
