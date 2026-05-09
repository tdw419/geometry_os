; DESCRIPTION: Renders a blue box of size 79x107 starting at (88, 72).
; PLAN: r0=88(x), r1=72(y), r2=79(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 72
LDI r2, 79
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
