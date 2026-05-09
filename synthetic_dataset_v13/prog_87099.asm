; DESCRIPTION: Renders a red box of size 18x84 starting at (325, 56).
; PLAN: r0=325(x), r1=56(y), r2=18(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 56
LDI r2, 18
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
