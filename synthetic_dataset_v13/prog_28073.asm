; DESCRIPTION: Renders a purple box of size 65x114 starting at (188, 8).
; PLAN: r0=188(x), r1=8(y), r2=65(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 8
LDI r2, 65
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
