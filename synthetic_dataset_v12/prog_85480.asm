; DESCRIPTION: Renders a green box of size 88x70 starting at (251, 17).
; PLAN: r0=251(x), r1=17(y), r2=88(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 17
LDI r2, 88
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
