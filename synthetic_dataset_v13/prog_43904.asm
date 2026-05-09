; DESCRIPTION: Renders a purple box of size 103x81 starting at (249, 123).
; PLAN: r0=249(x), r1=123(y), r2=103(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 123
LDI r2, 103
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
