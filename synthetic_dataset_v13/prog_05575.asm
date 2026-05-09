; DESCRIPTION: Renders a green box of size 106x88 starting at (300, 86).
; PLAN: r0=300(x), r1=86(y), r2=106(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 86
LDI r2, 106
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
