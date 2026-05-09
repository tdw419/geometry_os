; DESCRIPTION: Renders a blue box of size 114x80 starting at (183, 51).
; PLAN: r0=183(x), r1=51(y), r2=114(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 51
LDI r2, 114
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
