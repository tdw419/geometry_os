; DESCRIPTION: Renders a green box of size 88x35 starting at (25, 159).
; PLAN: r0=25(x), r1=159(y), r2=88(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 159
LDI r2, 88
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
