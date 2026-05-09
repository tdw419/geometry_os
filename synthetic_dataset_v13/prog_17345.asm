; DESCRIPTION: Renders a purple box of size 88x57 starting at (264, 61).
; PLAN: r0=264(x), r1=61(y), r2=88(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 61
LDI r2, 88
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
