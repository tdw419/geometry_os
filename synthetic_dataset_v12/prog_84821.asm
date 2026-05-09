; DESCRIPTION: Renders a blue box of size 88x105 starting at (161, 107).
; PLAN: r0=161(x), r1=107(y), r2=88(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 107
LDI r2, 88
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
