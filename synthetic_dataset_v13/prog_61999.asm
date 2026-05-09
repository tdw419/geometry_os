; DESCRIPTION: Renders a green box of size 23x88 starting at (197, 122).
; PLAN: r0=197(x), r1=122(y), r2=23(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 122
LDI r2, 23
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
