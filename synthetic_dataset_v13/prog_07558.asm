; DESCRIPTION: Renders a purple box of size 44x117 starting at (181, 76).
; PLAN: r0=181(x), r1=76(y), r2=44(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 76
LDI r2, 44
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
