; DESCRIPTION: Renders a purple box of size 97x97 starting at (86, 28).
; PLAN: r0=86(x), r1=28(y), r2=97(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 28
LDI r2, 97
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
