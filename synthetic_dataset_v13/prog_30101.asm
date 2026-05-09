; DESCRIPTION: Renders a white box of size 88x102 starting at (9, 20).
; PLAN: r0=9(x), r1=20(y), r2=88(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 20
LDI r2, 88
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
