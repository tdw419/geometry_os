; DESCRIPTION: Renders a purple box of size 28x92 starting at (166, 69).
; PLAN: r0=166(x), r1=69(y), r2=28(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 69
LDI r2, 28
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
