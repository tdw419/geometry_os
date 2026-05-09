; DESCRIPTION: Renders a blue box of size 112x19 starting at (3, 127).
; PLAN: r0=3(x), r1=127(y), r2=112(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 127
LDI r2, 112
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
