; DESCRIPTION: Renders a purple box of size 92x11 starting at (418, 66).
; PLAN: r0=418(x), r1=66(y), r2=92(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 66
LDI r2, 92
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
