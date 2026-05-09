; DESCRIPTION: Renders a purple box of size 33x33 starting at (45, 58).
; PLAN: r0=45(x), r1=58(y), r2=33(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 58
LDI r2, 33
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
