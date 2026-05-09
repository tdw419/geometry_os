; DESCRIPTION: Renders a blue box of size 19x103 starting at (112, 80).
; PLAN: r0=112(x), r1=80(y), r2=19(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 80
LDI r2, 19
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
