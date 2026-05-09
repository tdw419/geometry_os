; DESCRIPTION: Renders a blue box of size 106x112 starting at (196, 6).
; PLAN: r0=196(x), r1=6(y), r2=106(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 6
LDI r2, 106
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
