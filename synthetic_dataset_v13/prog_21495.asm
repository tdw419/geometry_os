; DESCRIPTION: Renders a red box of size 112x57 starting at (132, 85).
; PLAN: r0=132(x), r1=85(y), r2=112(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 85
LDI r2, 112
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
