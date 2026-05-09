; DESCRIPTION: Renders a blue box of size 70x10 starting at (200, 15).
; PLAN: r0=200(x), r1=15(y), r2=70(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 15
LDI r2, 70
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
