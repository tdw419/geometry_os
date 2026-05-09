; DESCRIPTION: Renders a blue box of size 84x100 starting at (302, 75).
; PLAN: r0=302(x), r1=75(y), r2=84(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 75
LDI r2, 84
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
