; DESCRIPTION: Renders a green box of size 15x22 starting at (1, 203).
; PLAN: r0=1(x), r1=203(y), r2=15(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 203
LDI r2, 15
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
