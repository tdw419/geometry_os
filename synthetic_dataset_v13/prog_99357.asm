; DESCRIPTION: Renders a white box of size 88x11 starting at (278, 9).
; PLAN: r0=278(x), r1=9(y), r2=88(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 9
LDI r2, 88
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
