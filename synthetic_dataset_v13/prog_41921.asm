; DESCRIPTION: Renders a blue box of size 100x87 starting at (70, 20).
; PLAN: r0=70(x), r1=20(y), r2=100(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 20
LDI r2, 100
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
