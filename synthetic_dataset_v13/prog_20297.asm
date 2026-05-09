; DESCRIPTION: Renders a purple box of size 80x88 starting at (226, 144).
; PLAN: r0=226(x), r1=144(y), r2=80(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 144
LDI r2, 80
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
