; DESCRIPTION: Renders a yellow box of size 33x110 starting at (85, 127).
; PLAN: r0=85(x), r1=127(y), r2=33(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 127
LDI r2, 33
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
