; DESCRIPTION: Renders a blue box of size 39x94 starting at (88, 117).
; PLAN: r0=88(x), r1=117(y), r2=39(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 117
LDI r2, 39
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
