; DESCRIPTION: Renders a purple box of size 59x72 starting at (338, 110).
; PLAN: r0=338(x), r1=110(y), r2=59(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 110
LDI r2, 59
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
