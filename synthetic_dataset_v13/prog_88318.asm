; DESCRIPTION: Renders a blue box of size 11x46 starting at (203, 12).
; PLAN: r0=203(x), r1=12(y), r2=11(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 12
LDI r2, 11
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
