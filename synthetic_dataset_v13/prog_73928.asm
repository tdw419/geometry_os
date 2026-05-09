; DESCRIPTION: Renders a red box of size 85x88 starting at (226, 117).
; PLAN: r0=226(x), r1=117(y), r2=85(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 117
LDI r2, 85
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
