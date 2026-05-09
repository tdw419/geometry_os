; DESCRIPTION: Renders a yellow box of size 20x99 starting at (47, 8).
; PLAN: r0=47(x), r1=8(y), r2=20(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 8
LDI r2, 20
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
