; DESCRIPTION: Renders a purple box of size 73x35 starting at (196, 112).
; PLAN: r0=196(x), r1=112(y), r2=73(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 112
LDI r2, 73
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
