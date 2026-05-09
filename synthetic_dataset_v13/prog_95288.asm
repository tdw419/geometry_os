; DESCRIPTION: Renders a green box of size 12x78 starting at (325, 94).
; PLAN: r0=325(x), r1=94(y), r2=12(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 94
LDI r2, 12
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
