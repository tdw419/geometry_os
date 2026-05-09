; DESCRIPTION: Renders a blue box of size 76x68 starting at (203, 44).
; PLAN: r0=203(x), r1=44(y), r2=76(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 44
LDI r2, 76
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
