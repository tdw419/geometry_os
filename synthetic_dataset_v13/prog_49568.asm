; DESCRIPTION: Renders a purple box of size 49x21 starting at (313, 102).
; PLAN: r0=313(x), r1=102(y), r2=49(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 102
LDI r2, 49
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
