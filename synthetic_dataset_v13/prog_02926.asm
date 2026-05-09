; DESCRIPTION: Renders a purple box of size 72x55 starting at (134, 25).
; PLAN: r0=134(x), r1=25(y), r2=72(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 25
LDI r2, 72
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
