; DESCRIPTION: Renders a blue box of size 20x108 starting at (370, 4).
; PLAN: r0=370(x), r1=4(y), r2=20(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 4
LDI r2, 20
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
