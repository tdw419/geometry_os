; DESCRIPTION: Renders a purple box of size 94x96 starting at (203, 20).
; PLAN: r0=203(x), r1=20(y), r2=94(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 20
LDI r2, 94
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
