; DESCRIPTION: Renders a yellow box of size 24x11 starting at (135, 110).
; PLAN: r0=135(x), r1=110(y), r2=24(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 110
LDI r2, 24
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
