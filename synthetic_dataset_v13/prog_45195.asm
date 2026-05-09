; DESCRIPTION: Renders a purple box of size 72x97 starting at (356, 85).
; PLAN: r0=356(x), r1=85(y), r2=72(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 85
LDI r2, 72
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
