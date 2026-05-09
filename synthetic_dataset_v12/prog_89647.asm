; DESCRIPTION: Renders a purple box of size 114x35 starting at (217, 10).
; PLAN: r0=217(x), r1=10(y), r2=114(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 10
LDI r2, 114
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
