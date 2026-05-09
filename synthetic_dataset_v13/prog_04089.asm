; DESCRIPTION: Renders a green box of size 110x117 starting at (376, 105).
; PLAN: r0=376(x), r1=105(y), r2=110(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 105
LDI r2, 110
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
