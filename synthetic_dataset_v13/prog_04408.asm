; DESCRIPTION: Renders a red box of size 35x52 starting at (7, 132).
; PLAN: r0=7(x), r1=132(y), r2=35(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 132
LDI r2, 35
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
