; DESCRIPTION: Renders a purple box of size 100x103 starting at (114, 145).
; PLAN: r0=114(x), r1=145(y), r2=100(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 145
LDI r2, 100
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
