; DESCRIPTION: Renders a purple box of size 47x88 starting at (417, 117).
; PLAN: r0=417(x), r1=117(y), r2=47(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 117
LDI r2, 47
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
