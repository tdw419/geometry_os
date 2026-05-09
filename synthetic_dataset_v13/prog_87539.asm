; DESCRIPTION: Renders a green box of size 38x88 starting at (117, 129).
; PLAN: r0=117(x), r1=129(y), r2=38(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 129
LDI r2, 38
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
