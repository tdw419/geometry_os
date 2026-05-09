; DESCRIPTION: Renders a red box of size 81x66 starting at (402, 99).
; PLAN: r0=402(x), r1=99(y), r2=81(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 99
LDI r2, 81
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
