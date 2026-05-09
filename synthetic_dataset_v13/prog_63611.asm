; DESCRIPTION: Renders a red box of size 88x63 starting at (250, 135).
; PLAN: r0=250(x), r1=135(y), r2=88(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 135
LDI r2, 88
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
