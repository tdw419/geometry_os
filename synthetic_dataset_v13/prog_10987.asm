; DESCRIPTION: Renders a green box of size 74x109 starting at (12, 88).
; PLAN: r0=12(x), r1=88(y), r2=74(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 88
LDI r2, 74
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
