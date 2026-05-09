; DESCRIPTION: Renders a purple box of size 112x104 starting at (69, 72).
; PLAN: r0=69(x), r1=72(y), r2=112(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 72
LDI r2, 112
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
