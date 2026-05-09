; DESCRIPTION: Renders a purple box of size 117x63 starting at (34, 51).
; PLAN: r0=34(x), r1=51(y), r2=117(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 51
LDI r2, 117
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
