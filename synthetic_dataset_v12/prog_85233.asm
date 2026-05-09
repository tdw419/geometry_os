; DESCRIPTION: Renders a yellow box of size 34x75 starting at (110, 51).
; PLAN: r0=110(x), r1=51(y), r2=34(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 51
LDI r2, 34
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
