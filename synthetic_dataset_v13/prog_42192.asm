; DESCRIPTION: Renders a red box of size 88x112 starting at (286, 94).
; PLAN: r0=286(x), r1=94(y), r2=88(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 94
LDI r2, 88
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
