; DESCRIPTION: Renders a yellow box of size 20x47 starting at (247, 110).
; PLAN: r0=247(x), r1=110(y), r2=20(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 110
LDI r2, 20
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
