; DESCRIPTION: Renders a magenta box of size 112x51 starting at (353, 157).
; PLAN: r0=353(x), r1=157(y), r2=112(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 157
LDI r2, 112
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
