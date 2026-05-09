; DESCRIPTION: Renders a green box of size 80x21 starting at (17, 137).
; PLAN: r0=17(x), r1=137(y), r2=80(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 137
LDI r2, 80
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
