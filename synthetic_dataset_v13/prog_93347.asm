; DESCRIPTION: Renders a yellow box of size 75x14 starting at (325, 22).
; PLAN: r0=325(x), r1=22(y), r2=75(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 22
LDI r2, 75
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
