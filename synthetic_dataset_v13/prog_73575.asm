; DESCRIPTION: Renders a purple box of size 114x90 starting at (28, 102).
; PLAN: r0=28(x), r1=102(y), r2=114(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 102
LDI r2, 114
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
