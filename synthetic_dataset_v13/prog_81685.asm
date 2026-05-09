; DESCRIPTION: Renders a purple box of size 28x84 starting at (247, 77).
; PLAN: r0=247(x), r1=77(y), r2=28(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 77
LDI r2, 28
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
