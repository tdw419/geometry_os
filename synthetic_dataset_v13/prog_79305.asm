; DESCRIPTION: Renders a purple box of size 29x81 starting at (175, 34).
; PLAN: r0=175(x), r1=34(y), r2=29(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 34
LDI r2, 29
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
