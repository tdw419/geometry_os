; DESCRIPTION: Renders a blue box of size 48x20 starting at (162, 87).
; PLAN: r0=162(x), r1=87(y), r2=48(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 87
LDI r2, 48
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
