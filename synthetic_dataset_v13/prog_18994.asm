; DESCRIPTION: Renders a purple box of size 33x22 starting at (7, 165).
; PLAN: r0=7(x), r1=165(y), r2=33(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 165
LDI r2, 33
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
