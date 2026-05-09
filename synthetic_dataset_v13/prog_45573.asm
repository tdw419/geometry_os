; DESCRIPTION: Renders a green box of size 112x96 starting at (309, 10).
; PLAN: r0=309(x), r1=10(y), r2=112(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 10
LDI r2, 112
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
