; DESCRIPTION: Renders a red box of size 28x36 starting at (13, 217).
; PLAN: r0=13(x), r1=217(y), r2=28(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 217
LDI r2, 28
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
