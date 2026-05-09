; DESCRIPTION: Renders a yellow box of size 51x110 starting at (13, 59).
; PLAN: r0=13(x), r1=59(y), r2=51(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 59
LDI r2, 51
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
