; DESCRIPTION: Renders a green box of size 17x110 starting at (362, 4).
; PLAN: r0=362(x), r1=4(y), r2=17(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 4
LDI r2, 17
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
