; DESCRIPTION: Renders a blue box of size 70x40 starting at (297, 72).
; PLAN: r0=297(x), r1=72(y), r2=70(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 72
LDI r2, 70
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
