; DESCRIPTION: Renders a blue box of size 105x112 starting at (72, 44).
; PLAN: r0=72(x), r1=44(y), r2=105(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 44
LDI r2, 105
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
