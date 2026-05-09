; DESCRIPTION: Renders a red box of size 63x94 starting at (19, 69).
; PLAN: r0=19(x), r1=69(y), r2=63(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 69
LDI r2, 63
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
