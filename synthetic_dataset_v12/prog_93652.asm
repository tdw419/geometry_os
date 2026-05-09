; DESCRIPTION: Renders a purple box of size 113x105 starting at (112, 101).
; PLAN: r0=112(x), r1=101(y), r2=113(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 101
LDI r2, 113
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
