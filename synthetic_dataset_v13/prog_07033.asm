; DESCRIPTION: Renders a purple box of size 29x26 starting at (3, 135).
; PLAN: r0=3(x), r1=135(y), r2=29(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 135
LDI r2, 29
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
