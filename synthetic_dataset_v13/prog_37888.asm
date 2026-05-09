; DESCRIPTION: Renders a blue box of size 116x34 starting at (350, 203).
; PLAN: r0=350(x), r1=203(y), r2=116(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 203
LDI r2, 116
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
