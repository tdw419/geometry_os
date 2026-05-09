; DESCRIPTION: Renders a yellow box of size 110x60 starting at (250, 77).
; PLAN: r0=250(x), r1=77(y), r2=110(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 77
LDI r2, 110
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
