; DESCRIPTION: Renders a purple box of size 88x117 starting at (197, 112).
; PLAN: r0=197(x), r1=112(y), r2=88(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 112
LDI r2, 88
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
