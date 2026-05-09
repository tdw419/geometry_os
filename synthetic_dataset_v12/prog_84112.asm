; DESCRIPTION: Renders a purple box of size 28x108 starting at (385, 100).
; PLAN: r0=385(x), r1=100(y), r2=28(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 100
LDI r2, 28
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
