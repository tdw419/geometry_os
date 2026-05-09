; DESCRIPTION: Renders a green box of size 112x110 starting at (256, 20).
; PLAN: r0=256(x), r1=20(y), r2=112(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 20
LDI r2, 112
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
