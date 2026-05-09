; DESCRIPTION: Renders a blue box of size 34x13 starting at (189, 99).
; PLAN: r0=189(x), r1=99(y), r2=34(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 99
LDI r2, 34
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
