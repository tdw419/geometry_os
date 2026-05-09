; DESCRIPTION: Renders a white box of size 22x110 starting at (54, 17).
; PLAN: r0=54(x), r1=17(y), r2=22(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 17
LDI r2, 22
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
