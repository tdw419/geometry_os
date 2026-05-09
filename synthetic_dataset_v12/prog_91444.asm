; DESCRIPTION: Renders a purple box of size 48x88 starting at (121, 112).
; PLAN: r0=121(x), r1=112(y), r2=48(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 112
LDI r2, 48
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
