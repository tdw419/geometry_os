; DESCRIPTION: Renders a green box of size 43x109 starting at (431, 100).
; PLAN: r0=431(x), r1=100(y), r2=43(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 100
LDI r2, 43
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
