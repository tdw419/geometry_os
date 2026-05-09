; DESCRIPTION: Renders a blue box of size 84x112 starting at (138, 108).
; PLAN: r0=138(x), r1=108(y), r2=84(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 108
LDI r2, 84
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
