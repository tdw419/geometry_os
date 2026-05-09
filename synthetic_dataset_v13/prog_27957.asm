; DESCRIPTION: Renders a purple box of size 92x60 starting at (76, 84).
; PLAN: r0=76(x), r1=84(y), r2=92(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 84
LDI r2, 92
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
