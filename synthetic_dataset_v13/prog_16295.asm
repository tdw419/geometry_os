; DESCRIPTION: Renders a blue box of size 50x97 starting at (453, 97).
; PLAN: r0=453(x), r1=97(y), r2=50(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 97
LDI r2, 50
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
