; DESCRIPTION: Renders a yellow box of size 45x110 starting at (283, 106).
; PLAN: r0=283(x), r1=106(y), r2=45(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 106
LDI r2, 45
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
