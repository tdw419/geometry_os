; DESCRIPTION: Renders a blue box of size 47x22 starting at (203, 81).
; PLAN: r0=203(x), r1=81(y), r2=47(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 81
LDI r2, 47
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
