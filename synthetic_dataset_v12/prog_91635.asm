; DESCRIPTION: Renders a red box of size 60x94 starting at (133, 56).
; PLAN: r0=133(x), r1=56(y), r2=60(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 56
LDI r2, 60
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
