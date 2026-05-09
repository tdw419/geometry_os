; DESCRIPTION: Renders a blue box of size 70x17 starting at (20, 153).
; PLAN: r0=20(x), r1=153(y), r2=70(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 153
LDI r2, 70
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
