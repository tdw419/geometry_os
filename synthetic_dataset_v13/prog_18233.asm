; DESCRIPTION: Renders a purple box of size 14x67 starting at (51, 48).
; PLAN: r0=51(x), r1=48(y), r2=14(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 48
LDI r2, 14
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
