; DESCRIPTION: Renders a green box of size 62x15 starting at (163, 70).
; PLAN: r0=163(x), r1=70(y), r2=62(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 70
LDI r2, 62
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
