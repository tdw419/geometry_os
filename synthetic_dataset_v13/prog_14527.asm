; DESCRIPTION: Renders a blue box of size 20x114 starting at (262, 9).
; PLAN: r0=262(x), r1=9(y), r2=20(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 9
LDI r2, 20
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
