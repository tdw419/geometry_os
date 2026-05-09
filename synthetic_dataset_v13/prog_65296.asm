; DESCRIPTION: Renders a purple box of size 92x56 starting at (350, 49).
; PLAN: r0=350(x), r1=49(y), r2=92(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 49
LDI r2, 92
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
