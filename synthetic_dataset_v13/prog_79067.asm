; DESCRIPTION: Renders a green box of size 84x25 starting at (21, 110).
; PLAN: r0=21(x), r1=110(y), r2=84(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 110
LDI r2, 84
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
