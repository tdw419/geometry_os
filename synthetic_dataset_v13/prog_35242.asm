; DESCRIPTION: Renders a blue box of size 14x10 starting at (276, 227).
; PLAN: r0=276(x), r1=227(y), r2=14(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 227
LDI r2, 14
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
