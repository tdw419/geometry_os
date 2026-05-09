; DESCRIPTION: Renders a red box of size 10x97 starting at (453, 36).
; PLAN: r0=453(x), r1=36(y), r2=10(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 36
LDI r2, 10
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
