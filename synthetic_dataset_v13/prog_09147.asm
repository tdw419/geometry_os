; DESCRIPTION: Renders a white box of size 88x78 starting at (128, 47).
; PLAN: r0=128(x), r1=47(y), r2=88(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 47
LDI r2, 88
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
