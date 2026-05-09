; DESCRIPTION: Renders a purple box of size 99x69 starting at (78, 7).
; PLAN: r0=78(x), r1=7(y), r2=99(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 7
LDI r2, 99
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
