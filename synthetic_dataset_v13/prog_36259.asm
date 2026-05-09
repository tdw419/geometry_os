; DESCRIPTION: Renders a purple box of size 61x102 starting at (0, 69).
; PLAN: r0=0(x), r1=69(y), r2=61(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 69
LDI r2, 61
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
