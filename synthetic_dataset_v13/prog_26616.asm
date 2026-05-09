; DESCRIPTION: Renders a purple box of size 57x88 starting at (405, 11).
; PLAN: r0=405(x), r1=11(y), r2=57(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 11
LDI r2, 57
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
