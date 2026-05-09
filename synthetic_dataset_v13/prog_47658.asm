; DESCRIPTION: Renders a green box of size 112x86 starting at (26, 110).
; PLAN: r0=26(x), r1=110(y), r2=112(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 110
LDI r2, 112
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
