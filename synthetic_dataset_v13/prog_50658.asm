; DESCRIPTION: Renders a white box of size 88x90 starting at (28, 147).
; PLAN: r0=28(x), r1=147(y), r2=88(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 147
LDI r2, 88
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
