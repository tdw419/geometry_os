; DESCRIPTION: Renders a green box of size 65x71 starting at (158, 84).
; PLAN: r0=158(x), r1=84(y), r2=65(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 84
LDI r2, 65
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
